WorkoutWars.ChallengeController = Ember.ObjectController.extend  
  isAttempting: false

  actions: 
    startAttempt: ->
      @set('isAttempting', true)

    createAttempt: ->
      console.log "create"
      challengeAttempt = @store.createRecord("challengeAttempt", {
        user: @get('currentUser.content')
        challenge: @get("model")  
        result: @get('result')      
      })
      challengeAttempt.save()
    