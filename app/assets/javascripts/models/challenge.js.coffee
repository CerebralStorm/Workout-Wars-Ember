WorkoutWars.Challenge = DS.Model.extend
  metric: DS.belongsTo('metric', { embedded: 'load' }) 
  challengeAttempts: DS.hasMany('challengeAttempt', { embedded: 'load' }) 
  name: DS.attr('string')
  description: DS.attr('string')
