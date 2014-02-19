WorkoutWars.CompetitionExercise = DS.Model.extend
  competition: DS.belongsTo('competition', { embedded: "always" }) 
  exercise: DS.belongsTo('exercise', { embedded: "always" })

