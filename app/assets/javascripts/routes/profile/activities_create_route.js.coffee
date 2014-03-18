WorkoutWars.ProfileActivitiesCreateRoute = Ember.Route.extend
  model: ->
    @store.createRecord('activity')