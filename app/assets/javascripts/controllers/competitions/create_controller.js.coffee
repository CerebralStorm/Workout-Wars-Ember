WorkoutWars.CompetitionsCreateController = Ember.Controller.extend
  needs: ['competitionWinConditions', 'currentUser', 'exercises']
  winConditions: Ember.computed.alias('controllers.competitionWinConditions.content')
  selectExercises: Ember.computed.alias('controllers.exercises.content')
  errors: Ember.computed.alias('model.errors')
  selectedExercise: null
  exercises: []

  actions:
    addExercise: ->
      exercise = @get('selectedExercise')
      @get('exercises').pushObject(exercise)
      @set('selectedExercise', null)

    submit: ->
      competition = @get('model')
      competition.set('startDate', moment(@get('model.startDate')).toDate())
      competition.set('endDate', moment(@get('model.endDate')).toDate())
      competition.set('user', @get('controllers.currentUser.content'))
      @get('exercises').forEach (exercise) =>
        compExercise = @store.createRecord('competitionExercise', {
          exercise: exercise
          competition: competition
        })
        competition.get('competitionExercises').then (compExercises) ->
          compExercises.pushObject(compExercise) 
      
      success = (competition) =>
        WorkoutWars.get("flash").success "Your competition was updated"
        @transitionToRoute('competition', competition)
      failure = (response) =>
        WorkoutWars.get("flash").danger "Your competition was not updated"
      competition.save().then success, failure