WorkoutWars.ActivitiesController = Ember.ArrayController.extend
  needs: ['application', 'user']

  isCurrentUser: (->
    currentUser = @get('controllers.application.currentUser')
    user = @get('controllers.user.content')
    user == currentUser
  ).property('content', )  