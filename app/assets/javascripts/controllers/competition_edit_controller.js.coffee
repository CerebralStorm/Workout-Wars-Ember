WorkoutWars.CompetitionEditController = Ember.ObjectController.extend

  actions:    
    addExercise: (exercise) -> 
      competition = @get('model')

      competitionExercise = {
        exerciseId: exercise.id
        exerciseableId: competition.id
        exerciseableType: "Competition"
      }

      competitionExercise = @store.createRecord('competitionExercise', competitionExercise)
      competitionExercise.save().then =>
        location.reload()

    removeExercise: (exercise) -> 
      competition = @get('model')
      competition.get('competitionExercises').then (competitionExercises) ->
        competitionExercises.forEach (competitionExercise) ->
          if competitionExercise
            competitionExerciseId = competitionExercise.get('exerciseId') 
            exerciseId = exercise.get('id')
            if "#{competitionExerciseId}" == "#{exerciseId}"
              competitionExercise.deleteRecord()
              competitionExercise.save().then =>
                location.reload()

    saveCompetition: ->  
      competition = @get("model")
      competition.save().then =>
        @transitionToRoute "competition", competition

    cancelSave: ->
      competition = @get("model")
      @transitionToRoute "competition", competition