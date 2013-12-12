WorkoutWars.UserIndexRoute = Ember.Route.extend
  model: (params) ->
    @store.find('user', params.user_id) 