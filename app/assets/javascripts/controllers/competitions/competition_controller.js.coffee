WorkoutWars.CompetitionController = Ember.ObjectController.extend
  needs: ['application']

  isAddingExercise: false

  isJoined: (->
    result = false
    currentUser = @get('controllers.application.currentUser')
    joins = @get('model').get('competitionJoins')
    joins.forEach (join, index) ->
      result = true if join.get('user') == currentUser   
    result
  ).property('competitionJoins.@each')

  actions:
    join: ->
      competitionJoin = @store.createRecord("competitionJoin", {
        user: @get('controllers.application.currentUser')
        competition: @get("model")        
      })
      competitionJoin.save()

    leave: ->
      #todo

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
    