WorkoutWars.ApplicationController = Ember.ObjectController.extend
  needs: ['exercises', 'currentUser']
  currentUser: Ember.computed.alias('controllers.currentUser.content')
  exercises: Ember.computed.alias('controllers.exercises.content')
  errors: Ember.computed.alias('content.errors')
  isSaving: false
  exercisesSorting: ["name"]
  alphabeticalExercises: Ember.computed.sort("exercises", "exercisesSorting")

  actions:
    submit: -> 
      @set('isSaving', true)
      activity = @get('model')
      activity.set('user', @get('currentUser.content'))

      success = (activity) =>
        @set('model', @store.createRecord('activity'))
        @set('isSaving', false)
        @set('value', null)
        WorkoutWars.get("modalFlash").success "Your activity was created"
      failure = (response) =>
        @set('isSaving', false)
        WorkoutWars.get("modalFlash").danger "Your activity was not created"
      
      activity.save().then success, failure
