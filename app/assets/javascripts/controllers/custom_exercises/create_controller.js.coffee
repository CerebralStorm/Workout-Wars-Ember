WorkoutWars.CustomExercisesCreateController = Ember.Controller.extend
  needs: ['metrics', 'currentUser']
  metrics: Ember.computed.alias('controllers.metrics.content')

  actions:
    submit: ->
      exercise = @get('model')
      exercise.set('user', @get('controllers.currentUser.content'))
      
      success = (exercise) =>
        WorkoutWars.get("flash").success "Your exercise was updated"
        @transitionToRoute('exercise', exercise)
      failure = (response) =>
        WorkoutWars.get("flash").danger "Your exercise was not updated"
      exercise.save().then success, failure