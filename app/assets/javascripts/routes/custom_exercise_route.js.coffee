WorkoutWars.CustomExerciseRoute = Ember.Route.extend
  model: (params) ->
    @store.find('exercise', params.exercise_id)