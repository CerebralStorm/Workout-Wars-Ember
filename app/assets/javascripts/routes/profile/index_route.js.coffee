WorkoutWars.ProfileIndexRoute = Ember.Route.extend
  model: ->
    @modelFor "profile"

  afterModel: ->
    @transitionTo('profile.stats')