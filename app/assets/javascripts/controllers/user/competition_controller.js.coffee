WorkoutWars.UserCompetitionController = Ember.ObjectController.extend
  needs: ['user']

  total: (->
    total = 0
    competition =  @get('model')
    user = @get('controllers.user.model')
    total
  ).property()

