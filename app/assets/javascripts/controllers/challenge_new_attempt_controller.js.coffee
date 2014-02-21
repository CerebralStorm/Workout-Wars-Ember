WorkoutWars.ChallengeNewAttemptController = Ember.ObjectController.extend 
  needs: ['challenge']
  metricName: Ember.computed.alias('controllers.challenge.model.exercise.metric.measurement')
  challenge: Ember.computed.alias('controllers.challenge.model')

  actions: 
    submit: ->
      challengeAttempt = @get('model')
      challengeAttempt.set('user', @get('currentUser.content'))
      challengeAttempt.set('challenge', @get("challenge")) 

      success = (challengeAttempt) =>
        @get("challenge.challengeAttempts").pushObject(challengeAttempt)
        WorkoutWars.get("flash").success "Your attempt was recorded and an activity has been logged."
        @transitionToRoute("challenge", @get('challenge'))
      failure = (response) =>
        WorkoutWars.get("flash").danger "Your attempt was not recorded"
      challengeAttempt.save().then success, failure
      
        