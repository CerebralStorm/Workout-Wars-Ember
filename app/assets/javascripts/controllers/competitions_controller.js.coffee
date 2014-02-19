WorkoutWars.CompetitionsController = Ember.ArrayController.extend
  sortProperties: ['name']

  newCompetitions: (->
    competitions = @get('model').filter (item) ->
      !item.get('started') and !item.get('finished')
    competitions.sortBy('name')
  ).property('model')

  startedCompetitions: (->
    competitions = @get('model').filter (item) ->
      item.get('started') and !item.get('finished')
    competitions.sortBy('name')
  ).property('model')

  finishedCompetitions: (->
    competitions = @get('model').filter (item) ->
      item.get('finished')
    competitions.sortBy('name')
  ).property('model')
