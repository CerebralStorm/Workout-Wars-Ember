WorkoutWars.CompetitionExercise = DS.Model.extend
  competition: DS.belongsTo('competition') 
  exercise: DS.belongsTo('exercise')

