WorkoutWars.ChallengeController = Ember.ObjectController.extend 

  rankedChallengeAttempts: (->
    @get('model.challengeAttempts').sortBy('result').reverse()
  ).property('model.challengeAttempts')

  actions:     
    deleteAttempt: (attempt) ->
      if window.confirm "Are you sure?"
        attempt.deleteRecord()
        attempt.save().then => 
          WorkoutWars.get("flash").danger "Your attempt was deleted"
    