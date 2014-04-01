WorkoutWars.IndexRoute = Ember.Route.extend
  model: ->
    @store.find('feed')

  actions:
    setSuccess: (message) ->
      WorkoutWars.get("flash").success message

    setWarning: (message) ->
      WorkoutWars.get("flash").warning message

    clearFlash: ->
      WorkoutWars.get("flash").clear()

    createCompetition: (exercise) ->
      # @controllerFor('competitions.create').get('exercises').pushObject(exercise)
      # console.log @controllerFor('competitions.create').get('exercises')
      @transitionTo "competitions.create"

    joinCompetition: (exercise) ->
      @transitionTo "competitions"


