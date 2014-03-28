WorkoutWars.ProfileExercisesController = Ember.ArrayController.extend
  needs: ['exercises', 'currentUser']
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

  userExercisesByDay: (->
    user = @get('currentUser')
    activitySet = Ember.A()
    if user      
      i = 0
      while i < 7
        date = @calculateDate(@get('startDate'), i).startOf('day')
        userExercises = user.get('userExercises').filter (activity) =>
          createdStart = moment(activity.get('createdAt')).startOf('day')
          createdStart.diff(date, 'days') == 0
        activitySet.pushObject(userExercises)
        i++
    activitySet
  ).property('startDate', 'currentUser.userExercises.@each')

  actions:
    prevWeek: ->
      date = moment(@get('startDate')).subtract('days', 7)
      @set('startDate', date)
    
    nextWeek: ->
      date = moment(@get('startDate')).add('days', 7)
      @set('startDate', date)
      