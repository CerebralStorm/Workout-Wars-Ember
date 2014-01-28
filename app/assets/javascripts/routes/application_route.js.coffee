WorkoutWars.ApplicationRoute = Ember.Route.extend
  setupController: ->
    @controllerFor('exercises').set 'model', @store.find('exercise')

  actions: 
    open: (name) ->
      @render 'modal1',
        into: "application"
        outlet: "modal"
        view: "modal"

    close: ->
      @disconnectOutlet
        outlet: 'modal'
        parentView: 'application'

    save: ->
      alert('actions work like normal!')