WorkoutWars.CompetitionController = Ember.ObjectController.extend
  needs: ['exercises']
  selectedExercise: null

  exercises: (->
    @get('controllers.exercises.content')
  ).property('controllers.exercises')

  competitionJoins: (->
    @get('content.competitionJoins').sortBy('rank')
  ).property('content.competitionJoins')

  isJoined: (->
    joined = false
    user = @get('currentUser.content')
    @get('model.competitionJoins').forEach (join) =>
      joined = true if join.get('user') == user
    joined
  ).property('model.competitionJoins.@each')

  canJoin: (->
    return false if @get('isJoined')
    maxNum = @get('model.maxParticipants')
    if maxNum
      return @get('numberOfUsers') < maxNum
    else
      true
  ).property('model.competitionJoins.@each', 'isJoined')

  currentPartial: (->
    "#{@get('model.status')}_competition"
  ).property('model')

  actions:
    join: ->
      competitionJoin = @store.createRecord("competitionJoin", {
        user: @get('currentUser.content')
        competition: @get("model")        
      })
      competitionJoin.save()

    leave: ->
      if window.confirm "Are you sure?"
        join = @get('model.competitionJoins').filterBy('user', @get('currentUser.content')).get('firstObject')
        if join 
          join.deleteRecord()
          join.save()

    removeUser: (join) ->
      if window.confirm "Are you sure?"
        join.deleteRecord()
        join.save()
        
    delete: (competition) ->
      if window.confirm "Are you sure?"
        @get("model").deleteRecord()
        @get("model").save().then =>
          @transitionToRoute("competitions")    
    
    edit: ->
      @transitionToRoute "competition.edit"

    addExercise: -> 
      return unless @get('selectedExercise')
      competitionExercise = @store.createRecord("competitionExercise", {
        exercise: @get('selectedExercise')
        competition: @get("model")        
      })
      competitionExercise.save()    

    removeExercise: (exercise) ->
      exercise.deleteRecord()
      exercise.save()




    