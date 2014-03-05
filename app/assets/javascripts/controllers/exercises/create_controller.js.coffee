WorkoutWars.ExercisesCreateController = Ember.Controller.extend
  needs: ['metrics', 'exercises']
  metrics: Ember.computed.alias('controllers.metrics.content')

  actions:
    submit: ->
      exercise = @get('model')
      exercise.set('user', @get('currentUser.content'))
      
      success = (exercise) =>
        WorkoutWars.get("flash").success "Your exercise was created. It will be available for use once it is approved by an admin."
        @transitionToRoute('exercise', exercise)
      failure = (response) =>
        WorkoutWars.get("flash").danger "Your exercise was not created"
      exercise.save().then success, failure