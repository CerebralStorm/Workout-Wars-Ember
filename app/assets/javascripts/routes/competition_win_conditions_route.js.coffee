WorkoutWars.ExercisesRoute = Ember.Route.extend
  model: ->
    @store.find("competitionWinCondition")