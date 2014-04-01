WorkoutWars.CompetitionExercise = DS.Model.extend
  competition: DS.belongsTo('competition', { async: true }) 
  exercise: DS.belongsTo('exercise', { async: true })

