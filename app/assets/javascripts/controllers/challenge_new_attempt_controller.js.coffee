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
        WorkoutWars.get("flash").success "Your attempt was recorded and an activity has been logged."
        console.log "success"
      failure = (response) =>
        WorkoutWars.get("flash").danger "Your attempt was not recorded"
      challengeAttempt.save success, failure
      @transitionToRoute("challenge", @get('challenge'))
        