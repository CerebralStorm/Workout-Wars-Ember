WorkoutWars.ActivitiesController = Ember.ArrayController.extend
  needs: ['user']

  isCurrentUser: (->
    currentUser = @get('currentUser.content')
    user = @get('controllers.user.content')
    user == currentUser
  ).property('content')  