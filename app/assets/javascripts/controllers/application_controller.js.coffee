WorkoutWars.ApplicationController = Ember.ObjectController.extend
  needs: ['currentUser']
  currentUser: Ember.computed.alias('controllers.currentUser.content')

  newExercise: (->
    @store.createRecord('activity')
  ).property()
