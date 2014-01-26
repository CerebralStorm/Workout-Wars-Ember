WorkoutWars.CompetitionController = Ember.ObjectController.extend
  needs: ['application']

  isJoined: (->
    @get('model').get('users').then (users) =>
      value = users.contains(@get('controllers.application.currentUser'))
      return value
    false
  ).property('competitionJoins.@each', 'users.@each')

  hasPermission: (->
    if currentUser = @get('controllers.application.currentUser')
      creator = @get('model.creator')
      currentUser.id == creator.id
    else
      false
  ).property('model', 'controllers.application.currentUser')

  actions:
    join: ->
      competitionJoin = @store.createRecord("competitionJoin", {
        user: @get('controllers.application.currentUser')
        competition: @get("model")        
      })
      competitionJoin.save().then (model) =>
        @get('model').get('competitionJoins').pushObject model

    leave: (join) ->
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
    