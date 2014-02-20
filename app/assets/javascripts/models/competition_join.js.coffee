WorkoutWars.CompetitionJoin = DS.Model.extend
  competition: DS.belongsTo('competition', { async: true }) 
  user:  DS.belongsTo('user', { async: true }) 
  total: DS.attr('number')
  rank: DS.attr('number')