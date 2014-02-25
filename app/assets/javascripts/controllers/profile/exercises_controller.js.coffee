WorkoutWars.ProfileExercisesController = Ember.ArrayController.extend
  needs: ['metrics']
  sortProperties: ['name']
  sortAscending: false
  metrics: Ember.computed.alias('controllers.metrics.content')

  newExercise: (->
    @store.createRecord('exercise', {
      user: @get('currentUser.content')
    })
  ).property()

  actions: 
    submit: ->
      exercise = @get('newExercise')
      
      success = (exercise) =>
        @set('newExercise', @store.createRecord('exercise', {
          user: @get('currentUser.content')
        }))
        WorkoutWars.get("flash").success "Your exercise was updated"
        @transitionToRoute('exercise', exercise)
      failure = (response) =>
        WorkoutWars.get("flash").danger "Your exercise was not updated"
      exercise.save().then success, failure
      