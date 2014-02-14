WorkoutWars.IndexRoute = Ember.Route.extend
  model: ->
    @store.find('user')

  actions:
    setSuccess: (message) ->
      WorkoutWars.get("flash").success message

    setWarning: (message) ->
      WorkoutWars.get("flash").warning message

    clearFlash: ->
      WorkoutWars.get("flash").clear()


