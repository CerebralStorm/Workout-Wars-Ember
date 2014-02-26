WorkoutWars.CompetitionActivity = DS.Model.extend
  user: DS.belongsTo('user', { async: true }) 
  activity: DS.belongsTo('activity', { async: true })
  competition: DS.belongsTo('competition', { async: true }) 