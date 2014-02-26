WorkoutWars.CustomExercisesRoute = Ember.Route.extend
  model: ->
    @modelFor("profile").get('userExercises')