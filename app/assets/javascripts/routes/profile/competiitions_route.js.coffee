WorkoutWars.ProfileCompetitionsRoute = Ember.Route.extend
  model: ->
    @modelFor('profile').get('competitionJoins')