WorkoutWars.ProfileExercisesController = Ember.ArrayController.extend
  needs: ['metrics']
  sortProperties: ['name']
  sortAscending: false
  metrics: Ember.computed.alias('controllers.metrics.content')

  newExercise: (->
    console.log @get('currentUser.content')
    @store.createRecord('exercise', {
      user: @get('currentUser.content')
    })
  ).property()

  actions: 
    submit: ->
      