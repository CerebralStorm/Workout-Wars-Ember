WorkoutWars.Feed = DS.Model.extend
  feedableId: DS.attr('number')
  feedableType: DS.attr('string')
  description: DS.attr('string')
  createdAt: DS.attr('date')