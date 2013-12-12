WorkoutWars.UserCompetitionsController = Ember.ArrayController.extend 
  actions:
    goToCompetition: (competition) ->
      @transitionToRoute "competition", competition