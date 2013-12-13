WorkoutWars.UserCompetitionsRoute = Ember.Route.extend
  model: ->
    @modelFor('user').get('competitions')