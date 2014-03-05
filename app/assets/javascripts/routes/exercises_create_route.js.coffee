WorkoutWars.ExercisesCreateRoute = Ember.Route.extend
  model: ->
    @store.createRecord('exercise')