WorkoutWars.ApplicationRoute = Ember.Route.extend
  setupController: ->
    @controllerFor('competitionWinConditions').set 'model', @store.find('competitionWinCondition')
    @controllerFor('competitionWinConditions').set 'model', @store.find('competitionWinCondition')
    @store.find('exercise')
    @controllerFor('exercises').set 'model', @store.filter 'exercise', (exercise) ->
      exercise.get('approved')
    @controllerFor('metrics').set 'model', @store.find('metric')
    @controllerFor('newExercise').set 'model', @store.createRecord('userExercise')

  renderTemplate: ->
    @render()
    @render "newExercise",
      outlet: "sidebar"
      into: "application"

  actions: 
    openExercise: (userExercise) ->
      @controllerFor('application').set 'model', userExercise
      @render 'user_exercise',
        into: "application"
        outlet: "modal"
        view: "modal"

    close: ->
      @disconnectOutlet
        outlet: 'modal'
        parentView: 'application'

    clearModalFlash: ->
      WorkoutWars.get("modalFlash").clear()