WorkoutWars.CompetitionController = Ember.ObjectController.extend
  needs: ['exercises', 'application']
  selectedUserExercise: Ember.computed.alias('controllers.application.selectedExercise')
  selectedExercise: null
  exercises: Ember.computed.alias('controllers.exercises.content')
  rankSort: ['rank']
  rankedJoins: Ember.computed.sort "competitionJoins", 'rankSort'
  highlight: false

  isJoined: (->
    joined = false
    user = @get('currentUser.content')
    @get('competitionJoins').forEach (join) =>
      joined = true if join.get('user') == user
    joined
  ).property('competitionJoins')

  canJoin: (->
    return false if @get('isJoined')
    maxNum = @get('model.maxParticipants')
    if maxNum
      return @get('numberOfUsers') < maxNum
    else
      true
  ).property('competitionJoins.@each', 'isJoined')

  currentPartial: (->
    "#{@get('model.status')}_competition"
  ).property('model')

  # setHighlight: (->
  #   exercise = @get('selectedUserExercise')
  #   if exercise
  #     competition = @get('content')
  #     competition.hasExercise(exercise).then (result) =>
  #       @set('highlight', result) 
  #   else
  #     @set('highlight', false)
  # ).observes('controllers.application.selectedExercise')

  actions:
    join: ->
      competitionJoin = @store.createRecord("competitionJoin", {
        user: @get('controllers.application.currentUser')
        competition: @get("model")        
      })
      competitionJoin.save().then (join) =>
        @get("model").reload()

    leave: ->
      if window.confirm "Are you sure?"
        join = @get('competitionJoins').filterBy('user', @get('currentUser.content')).get('firstObject')
        if join 
          join.destroyRecord().then =>
            @get("model").reload()

    start: ->
      model = @get('model')
      model.set('started', true)
      model.save()

    removeUser: (join) ->
      if window.confirm "Are you sure?"
        join.destroyRecord().then =>
            @transitionToRoute("competition", @get('model'))
        
    delete: (competition) ->
      if window.confirm "Are you sure?"
        @get("model").destroyRecord().then =>
          @transitionToRoute("competitions")    
    
    edit: ->
      @transitionToRoute "competition.edit"

    addExercise: -> 
      return unless @get('selectedExercise')
      competitionExercise = @store.createRecord("competitionExercise", {
        exercise: @get('selectedExercise')
        competition: @get("model")        
      })
      competitionExercise.save().then (exercise) =>
        @get("competitionExercises").pushObject(exercise) 
        @transitionToRoute("competition", @get('model'))   

    removeExercise: (exercise) ->
      exercise.destroyRecord().then =>
        @transitionToRoute("competition", @get('model'))

    sendFacebook: (competition) ->
      FB.ui
        method: 'send'
        link: window.location.href

    postFacebook: (competition) ->
      FB.ui
        method: "feed"
        link: window.location.href
        caption: "Come join #{competition.get('name')} on www.workout-wars.com"
      , (response) ->




    