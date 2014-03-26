WorkoutWars.NewExerciseController = Ember.ObjectController.extend
  needs: ['currentUser', 'exercises', 'application']
  currentUser: Ember.computed.alias('controllers.currentUser.content')
  showExercisePanel: Ember.computed.alias('controllers.application.showExercisePanel') 
  exercises: Ember.computed.alias('controllers.exercises.content')
  approvedExercises: Ember.computed.filterBy("exercises", 'approved', true)
  isSaving: false
  exercisesSorting: ["name"]
  alphabeticalExercises: Ember.computed.sort("approvedExercises", "exercisesSorting")

  setSelectedExercise: (->
    exercise = @get('model.exercise')
    @set('controllers.application.selectedExercise', exercise)
  ).observes('content.exercise')

  actions:
    submit: -> 
      @set('isSaving', true)
      activity = @get('model')
      activity.set('user', @get('currentUser'))

      success = (activity) =>
        @set('isSaving', false)
        @set('model', @store.createRecord('activity'))
        @set('controllers.application.selectedExercise', null)
        WorkoutWars.get("flash").success "Your activity was created"
      failure = (response) =>
        @set('isSaving', false)
        WorkoutWars.get("flash").danger "Your activity was not created"
      
      activity.save().then success, failure

    clearActivity: ->
      @set('model', @store.createRecord('activity'))
      @set('controllers.application.selectedExercise', null)
