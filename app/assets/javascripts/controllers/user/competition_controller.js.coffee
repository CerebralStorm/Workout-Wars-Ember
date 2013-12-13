WorkoutWars.UserCompetitionController = Ember.ObjectController.extend
  needs: ['user']

  total: ->
    competition =  @get('model')
    activities = competition.get('eventActivities')
    console.log activities
    console.log @get('controllers.user.model')
