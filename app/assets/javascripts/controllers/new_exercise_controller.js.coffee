WorkoutWars.NewExerciseController = Ember.ObjectController.extend
  needs: ['currentUser', 'exercises', 'application', 'index']
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
      userExercise = @get('model')
      userExercise.set('user', @get('currentUser'))

      success = (userExercise) =>
        @set('isSaving', false)
        @clearUserExercise
        WorkoutWars.get("flash").success "Your exercise was created"
      failure = (response) =>
        @set('isSaving', false)
        WorkoutWars.get("flash").danger "Your exercise was not created"
      
      userExercise.save().then success, failure

    clearUserExercise: =>
      @set('model', @store.createRecord('userExercise'))
      @set('controllers.application.selectedExercise', null)
