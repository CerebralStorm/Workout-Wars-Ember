WorkoutWars.ProfileStatsController = Ember.ObjectController.extend
  sortProperties: ['createdAt']
  sortAscending: false
  exerciseTotals: []

  init: ->
    @setExerciseTotals

  setExerciseTotals: (->
    @get('model.exerciseStatsTotal').then (totals) =>
      @set('exerciseTotals', totals)
  ).observes('model.userExercises.@each')