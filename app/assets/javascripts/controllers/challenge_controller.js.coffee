WorkoutWars.ChallengeController = Ember.ObjectController.extend 
  errors: null 
  actions: 
    createAttempt: ->
      challengeAttempt = @store.createRecord("challengeAttempt", {
        user: @get('currentUser.content')
        challenge: @get("model")  
        result: @get('result')      
      })
      success = (challenge) =>
        @set('result', null)
        WorkoutWars.get("flash").success "Your attempt was recorded"
      failure = (response) =>
        WorkoutWars.get("flash").danger "Your attempt was not recorded"
      challengeAttempt.save success, failure

    deleteAttempt: (attempt) ->
      if window.confirm "Are you sure?"
        attempt.deleteRecord()
        attempt.save().then => 
          WorkoutWars.get("flash").danger "Your attempt was deleted"
    