WorkoutWars.ApplicationController = Ember.ObjectController.extend
  needs: ['currentUser']
  currentUser: Ember.computed.alias('controllers.currentUser.content')
  showExercisePanel: true
  selectedExercise: null

  newExercise: (->
    @store.createRecord('activity')
  ).property()

  actions:      
    toggleExercisePanel: ->
      @toggleProperty('showExercisePanel')
      false

