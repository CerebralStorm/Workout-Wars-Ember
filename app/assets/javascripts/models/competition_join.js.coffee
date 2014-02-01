WorkoutWars.CompetitionJoin = DS.Model.extend
  competition: DS.belongsTo('competition', { embedded: 'load' }) 
  user:  DS.belongsTo('user', { embedded: 'load' }) 
  total: DS.attr('number')
  rank: DS.attr('number')