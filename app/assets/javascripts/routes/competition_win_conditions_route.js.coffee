WorkoutWars.CompetitionWinConditionsRoute = Ember.Route.extend
  model: ->
    @store.find("competitionWinCondition")