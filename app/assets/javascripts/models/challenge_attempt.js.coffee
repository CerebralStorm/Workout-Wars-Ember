WorkoutWars.ChallengeAttempt = DS.Model.extend
  challenge: DS.belongsTo('challenge', { embedded: 'load' }) 
  user: DS.belongsTo('user', { embedded: 'load' }) 
  result: DS.attr('string')