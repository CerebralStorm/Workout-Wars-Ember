WorkoutWars.CompetitionsController = Ember.ArrayController.extend
  sortProperties: ['finished', 'started', 'name']
  showUnstarted: true
  showStarted: false
  showFinished: false

  unstartedCompetitions: (->
    @get('model').filterBy('status', 'unstarted')
  ).property('model')

  startedCompetitions: (->
    @get('model').filterBy('status', 'started')
  ).property('model')

  finishedCompetitions: (->
    @get('model').filterBy('status', 'finished')
  ).property('model')

  currentCompetitions: (->
    competitions = Ember.A()
    competitions.pushObjects(@get('unstartedCompetitions')) if @get('showUnstarted')
    competitions.pushObjects(@get('startedCompetitions')) if @get('showStarted')
    competitions.pushObjects(@get('finishedCompetitions')) if @get('showFinished')
    competitions
  ).property('showUnstarted', 'showStarted', 'showFinished')

  actions: 
    showCompetition: (type) ->
      @set('showUnstarted', false)
      @set('showStarted', false)
      @set('showFinished', false)
      @set(type, true)
