WorkoutWars.TeamCompetitionsRoute = Ember.Route.extend
  model: ->
    @store.find('teamCompetition')