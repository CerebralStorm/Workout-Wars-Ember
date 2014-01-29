WorkoutWars.IndexRoute = Ember.Route.extend
  setupController: (controller) ->
    controller.set "title", "Workout Wars Home Page"

  actions:
    setSuccess: (message) ->
      WorkoutWars.get("flash").success message

    setWarning: (message) ->
      WorkoutWars.get("flash").warning message

    setCleared: ->
      WorkoutWars.get("flash").clear()
