WorkoutWars.Activity = DS.Model.extend 
  user: DS.belongsTo('user') 
  exercise: DS.belongsTo('exercise', { embedded: 'load' }) 
  value: DS.attr('number')

