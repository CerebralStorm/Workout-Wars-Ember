WorkoutWars.ApplicationRoute = Ember.Route.extend
  setupController: ->
    @controllerFor('exercises').set 'model', @store.find('exercise')
    @controllerFor('competitionWinConditions').set 'model', @store.find('competitionWinCondition')

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

    saveActivity: ->
      alert('actions work like normal!')