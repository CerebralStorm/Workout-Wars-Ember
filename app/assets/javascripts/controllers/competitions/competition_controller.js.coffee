WorkoutWars.CompetitionController = Ember.ObjectController.extend
  isJoined: (->
    if currentUser = @get('currentUser.content')
      @get('model.competitionJoins').forEach (join) =>
        if join.get('user') == currentUser
          return true
    else
      false
  ).property('model.competitionJoins')

  hasPermission: (->
    @get('currentUser.id') == @get('model.creator.id')
  ).property('model', 'currentUser.content')

  numberOfUsers: (->
    @get('model.competitionJoins').get('length')
  ).property('model.competitionJoins')

  actions:
    join: ->
      competitionJoin = @store.createRecord("competitionJoin", {
        user: @get('currentUser.content')
        competition: @get("model")        
      })
      competitionJoin.save()

    leave: ->
      if window.confirm "Are you sure?"
        @get('model.competitionJoins').forEach (join) =>
          if join.get('user') == @get('currentUser.content')
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

    addExercise: (exercise) ->  
      competitionExercise = @store.createRecord("competitionExercise", {
        exercise: exercise
        competition: @get("model")        
      })
      competitionExercise.save()    

    removeExercise: (exercise) ->
      exercise.deleteRecord()
      exercise.save()
    