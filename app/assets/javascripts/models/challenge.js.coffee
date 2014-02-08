WorkoutWars.Challenge = DS.Model.extend
  exercise: DS.belongsTo('exercise', { embedded: 'load' }) 
  challengeAttempts: DS.belongsTo('challengeAttempt', { embedded: 'load' }) 
  name: DS.attr('string')
  description: DS.attr('string')
