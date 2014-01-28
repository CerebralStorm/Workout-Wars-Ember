WorkoutWars.Exercise = DS.Model.extend
  name: DS.attr('string')
  reps: DS.attr('boolean')
  distance: DS.attr('boolean')
  duration: DS.attr('boolean')
  calories: DS.attr('boolean')
  weight: DS.attr('boolean')
  description: DS.attr('string')
  measurement: DS.attr('string')
