WorkoutWars.CompetitionController = Ember.ObjectController.extend

  isJoined: (->
    result = false
    @get('model.competitionJoins').forEach (join) =>
      if join.get('user') == @get('currentUser.content')
        result = true
    return result
  ).property('model.competitionJoins', 'currentUser.content')

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
    