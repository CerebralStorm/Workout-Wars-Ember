WorkoutWars.CustomExercisesIndexRoute = Ember.Route.extend
  model: ->
    @modelFor("profile").get('exercises')