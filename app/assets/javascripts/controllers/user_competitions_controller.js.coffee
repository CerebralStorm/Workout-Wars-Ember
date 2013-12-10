WorkoutWars.UserCompetitionsController = Ember.ArrayController.extend 
  actions:
    goToCompetition: (competition) ->
      console.log competition
      @transitionToRoute "competition", competition