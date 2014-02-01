WorkoutWars.CompetitionExercise = DS.Model.extend
  competition: DS.belongsTo('competition', { embedded: 'load' }) 
  exercise: DS.belongsTo('exercise', { embedded: 'load' })

