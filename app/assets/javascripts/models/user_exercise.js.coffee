WorkoutWars.UserExercise = DS.Model.extend
  exercise: DS.belongsTo('exercise', { async: true })
  user:  DS.belongsTo('user', { async: true })
