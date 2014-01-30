WorkoutWars.CompetitionController = Ember.ObjectController.extend
  needs: ['exercises']
  selectedExercise: null

  exercises: (->
    @get('controllers.exercises.content')
  ).property('controllers.exercises')

  isJoined: (->
    @get('model.competitionJoins').filterBy('user', @get('currentUser.content')).get('length') > 0
  ).property('model.competitionJoins.@each')

  hasPermission: (->
    @get('currentUser.id') == @get('model.user.id')
  ).property('model', 'currentUser.content')

  canJoin: (->
    maxNum = @get('model.maxParticipants')
    if maxNum
      return @get('numberOfUsers') < maxNum
    else
      true
  ).property('model.competitionJoins.@each')

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
    