WorkoutWars.CompetitionActivity = DS.Model.extend
  user: DS.belongsTo('user', { embedded: 'load' }) 
  activity: DS.belongsTo('activity', { embedded: 'load' })
  competition: DS.belongsTo('competition', { embedded: 'load' }) 