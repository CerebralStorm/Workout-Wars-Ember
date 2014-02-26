WorkoutWars.CompetitionJoin = DS.Model.extend
  competition: DS.belongsTo('competition', { async: true }) 
  user:  DS.belongsTo('user', { embedded: "always" }) 
  total: DS.attr('number')
  rank: DS.attr('number')
