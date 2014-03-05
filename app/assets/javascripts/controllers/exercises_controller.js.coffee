WorkoutWars.ExercisesController = Ember.ArrayController.extend
  sortProperties: ['name']
  exercisesSorting: ["name"]  
  approvedExercises: Ember.computed.filterBy("content", 'approved', true)
  pendingExercises: Ember.computed.filterBy("content", 'approved', false)
  alphabeticalApprovedExercises: Ember.computed.sort("approvedExercises", "exercisesSorting")
  alphabeticalPendingExercises: Ember.computed.sort("pendingExercises", "exercisesSorting")
