WorkoutWars.CompetitionEditController = Ember.ObjectController.extend

  actions:    
    addExercise: (exercise) -> 
      competitionExercise = {
        exercise: exercise
        competition: @get('model')
      }

      competitionExercise = @store.createRecord('competitionExercise', competitionExercise)
      competitionExercise.save()

    removeExercise: (exercise) -> 
      competition = @get('model')
      competition.get('competitionExercises').then (competitionExercises) ->
        competitionExercises.forEach (competitionExercise) ->
          if competitionExercise
            if competitionExercise.get('exercise') == exercise
              competitionExercise.deleteRecord()
              competitionExercise.save()

    saveCompetition: ->  
      competition = @get("model")
      competition.save().then =>
        @transitionToRoute "competition", competition

    cancelSave: ->
      competition = @get("model")
      @transitionToRoute "competition", competition