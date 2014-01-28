WorkoutWars.ActivitiesController = Ember.ArrayController.extend
  needs: ['user']
  sortProperties: ['createdAt']

  isCurrentUser: (->
    @get('currentUser.content') == @get('controllers.user.content')
  ).property('content')  