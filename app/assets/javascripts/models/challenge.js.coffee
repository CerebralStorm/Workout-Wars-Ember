WorkoutWars.Challenge = DS.Model.extend
  exercise: DS.belongsTo('exercise', { embedded: "always" }) 
  challengeAttempts: DS.hasMany('challengeAttempt', { embedded: "always" }) 
  name: DS.attr('string')
  description: DS.attr('string')
