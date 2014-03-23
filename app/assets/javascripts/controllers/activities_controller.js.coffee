WorkoutWars.ActivitiesController = Ember.ObjectController.extend
  needs: ['exercises', 'currentUser', 'application']
  sortProperties: ['createdAt']
  sortAscending: false
  startDate: null
  inChild: false
  currentUser: Ember.computed.alias('controllers.currentUser.content')
  exercises: Ember.computed.alias('controllers.exercises.content')
  approvedExercises: Ember.computed.filterBy("exercises", 'approved', true)
  isSaving: false
  exercisesSorting: ["name"]
  alphabeticalExercises: Ember.computed.sort("approvedExercises", "exercisesSorting")
  
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
    user = @get('currentUser')
    activitySet = Ember.A()
    if user      
      i = 0
      while i < 7
        date = @calculateDate(@get('startDate'), i).startOf('day')
        activities = user.get('activities').filter (activity) =>
          createdStart = moment(activity.get('createdAt')).startOf('day')
          createdStart.diff(date, 'days') == 0
        activitySet.pushObject(activities)
        i++
    activitySet
  ).property('startDate', 'currentUser')

  actions:
    submit: -> 
      @set('isSaving', true)
      activity = @get('model')
      activity.set('user', @get('currentUser'))

      success = (activity) =>
        @set('isSaving', false)
        @get('currentUser').reload()
        @transitionToRoute('activities')
        WorkoutWars.get("flash").success "Your activity was created"
      failure = (response) =>
        @set('isSaving', false)
        WorkoutWars.get("flash").danger "Your activity was not created"
      
      activity.save().then success, failure
    prevWeek: ->
      date = moment(@get('startDate')).subtract('days', 7)
      @set('startDate', date)
    
    nextWeek: ->
      date = moment(@get('startDate')).add('days', 7)
      @set('startDate', date)