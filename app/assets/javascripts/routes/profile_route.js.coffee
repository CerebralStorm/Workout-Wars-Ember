WorkoutWars.ProfileRoute = Ember.Route.extend
  model: (params) ->
    @store.find('user', params.user_id)

  afterModel: ->
    @transitionTo('profile.stats')