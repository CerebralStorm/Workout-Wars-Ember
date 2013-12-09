WorkoutWars.TeamChallengesRoute = Ember.Route.extend
  model:  ->
    @store.find('teamChallenge')
