WorkoutWars.CompetitionsController = Ember.ArrayController.extend
  sortProperties: ['activeness', 'started']
  sortAscending: false
  showUnstarted: true
  showStarted: true
  showFinished: true

  unstartedCompetitions: (->
    @get('model').filterBy('status', 'unstarted')
  ).property('content.@each')

  startedCompetitions: (->
    @get('model').filterBy('status', 'started')
  ).property('content.@each')

  finishedCompetitions: (->
    @get('model').filterBy('status', 'finished')
  ).property('content.@each')

  currentCompetitions: (->
    competitions = Ember.A()
    competitions.pushObjects(@get('unstartedCompetitions')) if @get('showUnstarted')
    competitions.pushObjects(@get('startedCompetitions')) if @get('showStarted')
    competitions.pushObjects(@get('finishedCompetitions')) if @get('showFinished')
    competitions
  ).property('showUnstarted', 'showStarted', 'showFinished', 'content.@each')
