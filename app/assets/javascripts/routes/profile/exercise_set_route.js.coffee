WorkoutWars.ProfileExerciseSetRoute = Ember.Route.extend
  model: ->
    @modelFor("profile").get('exerciseSet')