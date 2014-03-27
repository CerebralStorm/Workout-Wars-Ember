WorkoutWars.CompetitionUserExercise = DS.Model.extend
  user: DS.belongsTo('user', { async: true }) 
  userExercise: DS.belongsTo('userExercise', { async: true })
  competition: DS.belongsTo('competition', { async: true }) 