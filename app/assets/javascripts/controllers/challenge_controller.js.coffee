WorkoutWars.ChallengeController = Ember.ObjectController.extend   
  rankSort: ['result']
  sortedAttempts: Ember.computed.sort("challengeAttempts", 'rankSort')

  rankedAttempts: (->
    @get('sortedAttempts').reverse()
  ).property('sortedAttempts')

  actions:     
    deleteAttempt: (attempt) ->
      if window.confirm "Are you sure?"
        attempt.deleteRecord()
        attempt.save().then => 
          WorkoutWars.get("flash").danger "Your attempt was deleted"
    