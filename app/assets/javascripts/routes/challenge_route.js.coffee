WorkoutWars.ChallengeRoute = Ember.Route.extend
  model: (params) ->
    @store.find('challenge', params.challenge_id)