WorkoutWars.CompetitionActivity = DS.Model.extend
  user: DS.belongsTo('user', { embedded: "always" }) 
  activity: DS.belongsTo('activity', { embedded: "always" })
  competition: DS.belongsTo('competition', { embedded: "always" }) 