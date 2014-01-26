WorkoutWars.CompetitionController = Ember.ObjectController.extend
  needs: ['application']
  currentUser: Ember.computed.alias("controllers.application.currentUser")
  
  isJoined: (->
    if currentUser = @get('currentUser')
      @get('model.competitionJoins').forEach (join) =>
        if join.get('user') == @get('currentUser')
          return true
    else
      false
  ).property('model.competitionJoins')

  hasPermission: (->
    if currentUser = @get('currentUser')
      creator = @get('model.creator')
      currentUser.id == creator.id
    else
      false
  ).property('model', 'currentUser')

  actions:
    join: ->
      competitionJoin = @store.createRecord("competitionJoin", {
        user: @get('currentUser')
        competition: @get("model")        
      })
      competitionJoin.save()

    leave: ->
      if window.confirm "Are you sure?"
        @get('model.competitionJoins').forEach (join) =>
          if join.get('user') == @get('currentUser')
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
      @set('isAddingExercise', true)
      competitionExercise = @store.createRecord("competitionExercise", {
        exercise: exercise
        competition: @get("model")        
      })

      success = (competitionExercise) =>
        @set('isAddingExercise', false)
      failure = (response) =>
        @set('isAddingExercise', false)
        console.log response
      competitionExercise.save().then success, failure      

    removeExercise: (exercise) ->
      exercise.deleteRecord()
      exercise.save()
    