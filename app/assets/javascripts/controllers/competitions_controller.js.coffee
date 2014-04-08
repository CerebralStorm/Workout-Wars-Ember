WorkoutWars.CompetitionsController = Ember.ArrayController.extend
  itemController: 'competition'
  needs: ['application']
  sortProperties: ['activeness', 'started']
  sortAscending: false
  selectedExercise: Ember.computed.alias('controllers.application.selectedExercise')
