WorkoutWars.ProfileChallengesRoute = Ember.Route.extend
  model: ->
    @modelFor('profile').get('challenges')