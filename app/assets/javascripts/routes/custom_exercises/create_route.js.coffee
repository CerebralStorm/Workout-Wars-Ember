WorkoutWars.CustomExercisesCreateRoute = Ember.Route.extend
  model: ->
    @store.createRecord('exercise', {
      user: @get('currentUser.content')
    })