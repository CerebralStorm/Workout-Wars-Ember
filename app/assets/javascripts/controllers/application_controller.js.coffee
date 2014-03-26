WorkoutWars.ApplicationController = Ember.ObjectController.extend
  needs: ['currentUser']
  currentUser: Ember.computed.alias('controllers.currentUser.content')
  showExercisePanel: true

  newExercise: (->
    @store.createRecord('activity')
  ).property()

  actions:      
    toggleExercisePanel: ->
      @toggleProperty('showExercisePanel')
      false

