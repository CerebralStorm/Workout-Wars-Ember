WorkoutWars.CompetitionsCreateController = Ember.Controller.extend
  needs: ['competitionWinConditions', 'currentUser', 'exercises', 'competitions']
  winConditions: Ember.computed.alias('controllers.competitionWinConditions.content')
  approvedExercises: Ember.computed.alias('controllers.exercises.content')
  errors: Ember.computed.alias('model.errors')
  selectedExercise: null
  exercises: []
  canClearExercises: true

  selectExercises: (->
    @get('approvedExercises').filter (exercise) =>
      !@get('exercises').contains(exercise)
  ).property('exercises.@each', 'approvedExercises.@each')

  clearExercises: (->
    if @get('canClearExercises')
      @set('exercises', []) unless @get('content.competitionWinCondition.multiExercise')
  ).observes('content.competitionWinCondition')

  canAddExercise: (->
    return true if @get('exercises').length < 1
    @get('content.competitionWinCondition.multiExercise')
  ).property('exercises.@each', 'content.competitionWinCondition')

  actions:
    addExercise: ->
      exercise = @get('selectedExercise')
      @get('exercises').pushObject(exercise)
      @set('selectedExercise', null)

    removeExercise: (exercise) ->
      @get('exercises').removeObject(exercise)

    submit: ->
      @set('canClearExercises', false)
      competition = @get('model')
      competition.set('startDate', moment(@get('model.startDate')).toDate())
      competition.set('endDate', moment(@get('model.endDate')).toDate())
      competition.set('user', @get('controllers.currentUser.content'))
      
      success = (competition) =>
        promises = Ember.A()
        @get('exercises').forEach (exercise) =>
          compExercise = @store.createRecord('competitionExercise', {
            exercise: exercise
            competition: competition
          })
          promises.push compExercise.saveWhenSettled()

        Ember.RSVP.Promise.all(promises).then (resolvedPs) =>
          WorkoutWars.get("flash").success "Your competition was updated"
          @transitionToRoute('competition', competition).then =>
            competition.reload()
            @set('canClearExercises', true)
        
      failure = (response) =>
        WorkoutWars.get("flash").danger "Your competition was not updated"
      competition.save().then success, failure