WorkoutWars.ApplicationRoute = Ember.Route.extend
  setupController: ->
    @controllerFor('exercises').set 'model', @store.find('exercise')

  actions: 
    open: (name) ->
      @controllerFor('application').set 'model', @store.createRecord('activity')
      @render name,
        into: "application"
        outlet: "modal"
        view: "modal"

    close: ->
      @disconnectOutlet
        outlet: 'modal'
        parentView: 'application'

    saveActivity: ->
      alert('actions work like normal!')