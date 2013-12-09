WorkoutWars.CompetitionEditController = Ember.ObjectController.extend

  actions:    
    addExercise: (exercise) -> 
      competition = @get('model')

      eventExercise = {
        exerciseId: exercise.id
        exerciseableId: competition.id
        exerciseableType: "Competition"
      }

      eventExercise = competition.get('eventExercises').createRecord(eventExercise)
      eventExercise.save()

    saveCompetition: ->  
      competition = @get("model")
      competition.save()
      @transitionToRoute "competition", competition

    cancelSave: ->
      competition = @get("model")
      @transitionToRoute "competition", competition