WorkoutWars.ProfileActivitiesController = Ember.ArrayController.extend
  sortProperties: ['createdAt']
  sortAscending: false
  startDate: null
  
  endDate: (->
    moment(@get('startDate')).add('days', 6)
  ).property('startDate')

  init: ->
    day = moment().subtract('days', moment().day())
    @set('startDate', day)
    
  sundayActivities: (->
    date = moment(@get('startDate'))
    date = date.add('days', 0).startOf('day')
    @get('model').filter (activity) =>
      createdStart = moment(activity.get('createdAt')).startOf('day')
      createdStart.diff(date, 'days') == 0
  ).property('startDate', 'content.@each')

  mondayActivities: (->
    date = moment(@get('startDate'))
    date = date.add('days', 1).startOf('day')
    @get('model').filter (activity) =>
      createdStart = moment(activity.get('createdAt')).startOf('day')
      createdStart.diff(date, 'days') == 0
  ).property('startDate', 'content.@each')

  tuesdayActivities: (->
    date = moment(@get('startDate'))
    date = date.add('days', 2).startOf('day')
    @get('model').filter (activity) =>
      createdStart = moment(activity.get('createdAt')).startOf('day')
      createdStart.diff(date, 'days') == 0
  ).property('startDate', 'content.@each')

  wednesdayActivities: (->
    date = moment(@get('startDate'))
    date = date.add('days', 3).startOf('day')
    @get('model').filter (activity) =>
      createdStart = moment(activity.get('createdAt')).startOf('day')
      createdStart.diff(date, 'days') == 0
  ).property('startDate', 'content.@each')

  thursdayActivities: (->
    date = moment(@get('startDate'))
    date = date.add('days', 4).startOf('day')
    @get('model').filter (activity) =>
      createdStart = moment(activity.get('createdAt')).startOf('day')
      createdStart.diff(date, 'days') == 0
  ).property('startDate', 'content.@each')

  fridayActivities: (->
    date = moment(@get('startDate'))
    date = date.add('days', 5).startOf('day')
    @get('model').filter (activity) =>
      createdStart = moment(activity.get('createdAt')).startOf('day')
      createdStart.diff(date, 'days') == 0
  ).property('startDate', 'content.@each')

  saturdayActivities: (->
    date = moment(@get('startDate'))
    date = date.add('days', 6).startOf('day')
    @get('model').filter (activity) =>
      createdStart = moment(activity.get('createdAt')).startOf('day')
      createdStart.diff(date, 'days') == 0
  ).property('startDate', 'content.@each')

  actions:
    prevWeek: ->
      date = moment(@get('startDate')).subtract('days', 7)
      @set('startDate', date)
    
    nextWeek: ->
      date = moment(@get('startDate')).add('days', 7)
      @set('startDate', date)