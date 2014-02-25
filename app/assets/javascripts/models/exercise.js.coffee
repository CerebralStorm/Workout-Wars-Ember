WorkoutWars.Exercise = DS.Model.extend
  metric:  DS.belongsTo('metric', { async: true })
  user:  DS.belongsTo('user', { async: true })
  name: DS.attr('string')
  description: DS.attr('string')
  experienceMultiplier:  DS.attr('number')

  validations:
    name:
      presence: true
      length:
        minimum: 5

    description:
      presence: true

    user:
      presence: true

    metric:
      presence: true

    experienceMultiplier:
      numericality:
        onlyInteger: true
        greaterThan: 0
        lessThanOrEqualTo: 100 
