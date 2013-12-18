WorkoutWars.UserCompetitionController = Ember.ObjectController.extend
  needs: ['user']

  total: (activities) ->
    console.log @get('model').get('competitionActivities')
    console.log activities

    
