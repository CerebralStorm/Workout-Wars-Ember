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
      userExercise = @get('model')
      userExercise.set('user', @get('currentUser'))

      success = (userExercise) =>
        @set('isSaving', false)
        @set('model', @store.createRecord('userExercise'))
        @set('controllers.application.selectedExercise', null)
        WorkoutWars.get("flash").success "Your userExercise was created"
      failure = (response) =>
        @set('isSaving', false)
        WorkoutWars.get("flash").danger "Your userExercise was not created"
      
      userExercise.save().then success, failure

    clearUserExercise: ->
      @set('model', @store.createRecord('userExercise'))
      @set('controllers.application.selectedExercise', null)
