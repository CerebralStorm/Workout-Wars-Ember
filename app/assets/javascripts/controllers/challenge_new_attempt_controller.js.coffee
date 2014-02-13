WorkoutWars.ChallengeNewAttemptController = Ember.ObjectController.extend 
  needs: ['challenge']
  metricName: Ember.computed.alias('controllers.challenge.model.metric.name')
  challenge: Ember.computed.alias('controllers.challenge.model')

  actions: 
    create: (challengeAttempt) ->
      console.log challengeAttempt
      # challengeAttempt.set('user', @get('currentUser.content'))
      # challengeAttempt.set('challenge', @get("challenge")) 

      # success = (challenge) =>
      #   WorkoutWars.get("flash").success "Your attempt was recorded"
      # failure = (response) =>
      #   WorkoutWars.get("flash").danger "Your attempt was not recorded"
      # challengeAttempt.save success, failure
        