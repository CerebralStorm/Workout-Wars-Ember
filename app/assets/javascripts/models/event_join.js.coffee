WorkoutWars.EventJoin = DS.Model.extend
  competition: DS.belongsTo('competition') 
  user:  DS.belongsTo('user') 
  joinableId: DS.attr('number')
  joinableType: DS.attr('string')