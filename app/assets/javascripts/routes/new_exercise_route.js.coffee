WorkoutWars.NewExerciseRoute = Ember.Route.extend
  model: ->
    @store.createRecord('newExercise')