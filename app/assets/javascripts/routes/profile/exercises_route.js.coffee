WorkoutWars.ProfileExercisesRoute = Ember.Route.extend
  model: ->
    @modelFor('profile').get('userExercise')