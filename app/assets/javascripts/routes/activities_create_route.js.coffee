WorkoutWars.ActivitiesCreateRoute = Ember.Route.extend
  model: ->
    @store.createRecord('activity')

  renderTemplate: ->
    @render "activity.edit",
      controller: "activitiesCreate"