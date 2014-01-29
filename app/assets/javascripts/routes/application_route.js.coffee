WorkoutWars.ApplicationRoute = Ember.Route.extend
  setupController: ->
    @controllerFor('competitionWinConditions').set 'model', @store.find('competitionWinCondition')
    @controllerFor('exercises').set 'model', @store.find('exercise')

  actions: 
    logActivity: ->
      @controllerFor('application').set 'model', @store.createRecord('activity')
      @render 'log_activity',
        into: "application"
        outlet: "modal"
        view: "modal"

    close: ->
      @disconnectOutlet
        outlet: 'modal'
        parentView: 'application'

    clearModalFlash: ->
      WorkoutWars.get("modalFlash").clear()