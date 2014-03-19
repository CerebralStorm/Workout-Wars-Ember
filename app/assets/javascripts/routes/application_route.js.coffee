WorkoutWars.ApplicationRoute = Ember.Route.extend
  setupController: ->
    @controllerFor('competitionWinConditions').set 'model', @store.find('competitionWinCondition')
    @store.find('exercise')
    @controllerFor('exercises').set 'model', @store.filter 'exercise', (exercise) ->
      exercise.get('approved')
    @controllerFor('metrics').set 'model', @store.find('metric')

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