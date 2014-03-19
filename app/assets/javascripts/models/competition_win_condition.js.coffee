WorkoutWars.CompetitionWinCondition = DS.Model.extend
  name: DS.attr('string') 
  description: DS.attr('string')
  multiExercise: DS.attr('boolean')