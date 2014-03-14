WorkoutWars.CompetitionsController = Ember.ArrayController.extend
  sortProperties: ['finished', 'started', 'name']
  isUnstarted: true
  isStarted: true
  isFinished: true

  selectedCompetitions: (->
    competitions = Ember.A()
    competitions.pushObjects(@get('model').filterBy('status', 'unstarted')) if @get('isUnstarted')
    competitions.pushObjects(@get('model').filterBy('status', 'started')) if @get('isStarted')
    competitions.pushObjects(@get('model').filterBy('status', 'finished')) if @get('isFinished')
    competitions
  ).property('isFinished', 'isStarted', 'isUnstarted')
