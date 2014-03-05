WorkoutWars.ExercisesController = Ember.ArrayController.extend
  sortProperties: ['name']  
  approvedExercises: Ember.computed.filterBy("content", 'approved', true)
  pendingExercises: Ember.computed.filterBy("content", 'approved', false)
