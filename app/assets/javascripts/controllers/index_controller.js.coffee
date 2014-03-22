WorkoutWars.IndexController = Ember.ArrayController.extend
  needs: ['currentUser']
  currentUser: Ember.computed.alias('controllers.currentUser.content')
  sortProperties: ['activeness']
  sortAscending: false