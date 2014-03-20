WorkoutWars.CompetitionController = Ember.ObjectController.extend
  needs: ['exercises']
  selectedExercise: null
  exercises: Ember.computed.alias('controllers.exercises.content')
  rankSort: ['rank']
  rankedJoins: Ember.computed.sort "competitionJoins", 'rankSort'

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

  actions:
    join: ->
      competitionJoin = @store.createRecord("competitionJoin", {
        user: @get('currentUser.content')
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




    