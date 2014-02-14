WorkoutWars.ChallengeController = Ember.ObjectController.extend 

  actions:     
    deleteAttempt: (attempt) ->
      if window.confirm "Are you sure?"
        attempt.deleteRecord()
        attempt.save().then => 
          WorkoutWars.get("flash").danger "Your attempt was deleted"
    