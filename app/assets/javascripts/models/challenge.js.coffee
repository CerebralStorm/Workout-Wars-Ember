WorkoutWars.Challenge = DS.Model.extend
  exercise: DS.belongsTo('exercise', { async: true }) 
  challengeAttempts: DS.hasMany('challengeAttempt', { embedded: "always" }) 
  name: DS.attr('string')
  description: DS.attr('string')

  numOfAttempts: (->
    @get('challengeAttempts.length')
  ).property('challengeAttempts.@each')

  attempts: (->
    Ember.ArrayProxy.createWithMixins(Ember.SortableMixin,
      sortProperties: [ 'id']
      content: @get('challengeAttempts')
    )
  ).property('challengeAttempts')