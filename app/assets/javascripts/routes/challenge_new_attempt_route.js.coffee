WorkoutWars.ChallengeNewAttemptRoute = Ember.Route.extend
  model: ->
    @store.createRecord('challengeAttempt')