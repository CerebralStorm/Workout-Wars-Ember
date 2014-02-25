WorkoutWars.Exercise = DS.Model.extend
  metric:  DS.belongsTo('metric', { async: true })
  user:  DS.belongsTo('user', { async: true })
  name: DS.attr('string')
  description: DS.attr('string')
  experienceMultiplier:  DS.attr('number')
