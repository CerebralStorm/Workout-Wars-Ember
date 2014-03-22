WorkoutWars.ActivitiesRoute = Ember.Route.extend
  model: (user) ->
    @store.find('activity')

