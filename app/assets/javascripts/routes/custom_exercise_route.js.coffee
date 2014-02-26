WorkoutWars.CustomExerciseRoute = Ember.Route.extend
  model: (params) ->
    @store.find('userExercise', params.userExercise_id)