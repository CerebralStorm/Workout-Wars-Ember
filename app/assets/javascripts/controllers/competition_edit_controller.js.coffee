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
      eventExercise.save().then =>
        location.reload()

    removeExercise: (exercise) -> 
      competition = @get('model')
      competition.get('eventExercises').then (eventExercises) ->
        eventExercises.forEach (eventExercise) ->
          if eventExercise
            eventExerciseId = eventExercise.get('exerciseId') 
            exerciseId = exercise.get('id')
            if "#{eventExerciseId}" == "#{exerciseId}"
              eventExercise.deleteRecord()
              eventExercise.save().then =>
                location.reload()

    saveCompetition: ->  
      competition = @get("model")
      competition.save().then =>
        @transitionToRoute "competition", competition

    cancelSave: ->
      competition = @get("model")
      @transitionToRoute "competition", competition