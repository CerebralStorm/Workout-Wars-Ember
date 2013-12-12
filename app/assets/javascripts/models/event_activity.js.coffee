WorkoutWars.EventActivity = DS.Model.extend
  user: DS.belongsTo('user') 
  activity: DS.belongsTo('activity') 
  actableId: DS.attr('number')
  actableId: DS.attr('number')
  actableType: DS.attr('string')