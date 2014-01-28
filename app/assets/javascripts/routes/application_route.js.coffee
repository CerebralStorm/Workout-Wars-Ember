WorkoutWars.ApplicationRoute = Ember.Route.extend
  setupController: ->
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

    saveActivity: ->
      alert('actions work like normal!')