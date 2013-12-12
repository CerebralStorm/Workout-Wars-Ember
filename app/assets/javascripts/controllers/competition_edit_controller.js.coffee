WorkoutWars.CompetitionEditController = Ember.ObjectController.extend

  actions:    
    addExercise: (exercise) -> 
      competition = @get('model')

      eventExercise = {
        exerciseId: exercise.id
        exerciseableId: competition.id
        exerciseableType: "Competition"
      }

      eventExercise = @store.createRecord('eventExercise', eventExercise)
      eventExercise.save()
      location.reload()

    removeExercise: (exercise) -> 
      console.log @get("model")
      eventExercises = @get("model").get('eventExercises')
      eventExercises.forEach (eventExercise) ->
        if eventExercise
          eventExerciseId = eventExercise.get('exerciseId') 
          exerciseId = exercise.get('id')
          if "#{eventExerciseId}" == "#{exerciseId}"
            eventExercise.deleteRecord()
            eventExercise.save()
            location.reload()

    saveCompetition: ->  
      competition = @get("model")
      competition.save().then =>
        @transitionToRoute "competition", competition

    cancelSave: ->
      competition = @get("model")
      @transitionToRoute "competition", competition