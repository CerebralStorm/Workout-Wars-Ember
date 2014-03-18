WorkoutWars.ProfileActivitiesRoute = Ember.Route.extend
  model: ->
    @modelFor('profile').get('activities')

