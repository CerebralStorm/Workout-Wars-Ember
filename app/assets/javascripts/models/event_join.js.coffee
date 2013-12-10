WorkoutWars.EventJoin = DS.Model.extend
  competition: DS.belongsTo('competition') 
  userId: DS.attr('number')
  joinableId: DS.attr('number')
  joinableType: DS.attr('string')