WorkoutWars.Metric = DS.Model.extend
  exerciseMetrics: DS.hasMany('exerciseMetric', { async: true })
  name: DS.attr('string') 
  measurement: DS.attr('string')