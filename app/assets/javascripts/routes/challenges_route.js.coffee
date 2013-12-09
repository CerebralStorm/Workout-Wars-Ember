WorkoutWars.ChallengesRoute = Ember.Route.extend
  model: ->
    @store.find("challenge")