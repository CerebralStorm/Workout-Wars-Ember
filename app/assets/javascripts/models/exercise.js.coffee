WorkoutWars.Exercise = DS.Model.extend
  metric:  DS.belongsTo('metric', { async: true })
  name: DS.attr('string')
  description: DS.attr('string')
  experienceMultiplier:  DS.attr('number')
