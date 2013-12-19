WorkoutWars.CompetitionActivity = DS.Model.extend
  user: DS.belongsTo('user') 
  activity: DS.belongsTo('activity')
  competition: DS.belongsTo('competition') 