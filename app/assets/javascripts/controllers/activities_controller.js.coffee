WorkoutWars.ActivitiesController = Ember.ArrayController.extend
  sortProperties: ['createdAt']
  sortAscending: false
  startDate: null
  inChild: false
  
  endDate: (->
    moment(@get('startDate')).add('days', 6)
  ).property('startDate')

  init: ->
    day = moment().subtract('days', moment().day())
    @set('startDate', day)

  calculateDate: (startDate, numOfDays) ->
    date = moment(startDate)
    date.add('days', numOfDays)

  tableTitles: (->
    titles = Ember.A()
    i = 0
    while i < 7
      titles.pushObject(@calculateDate(@get('startDate'), i).format('dddd MM/DD'))
      i++
    titles
  ).property('startDate')

  activitiesByDay: (->
    activitySet = Ember.A()
    i = 0
    while i < 7
      date = @calculateDate(@get('startDate'), i).startOf('day')
      activities = @get('model').filter (activity) =>
        createdStart = moment(activity.get('createdAt')).startOf('day')
        createdStart.diff(date, 'days') == 0
      activitySet.pushObject(activities)
      i++
    activitySet
  ).property('startDate', 'content.@each')

  actions:
    prevWeek: ->
      date = moment(@get('startDate')).subtract('days', 7)
      @set('startDate', date)
    
    nextWeek: ->
      date = moment(@get('startDate')).add('days', 7)
      @set('startDate', date)