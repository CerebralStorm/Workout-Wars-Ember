WorkoutWars.ActivitiesRoute = Ember.Route.extend
  model: ->
    @modelFor('profile').get('activities')