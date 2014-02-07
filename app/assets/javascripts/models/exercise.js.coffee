WorkoutWars.Exercise = DS.Model.extend
  name: DS.attr('string')
  description: DS.attr('string')
  metric:  DS.belongsTo('metric', { embedded: 'load' })
