WorkoutWars.ProfileActivitiesCreateController = Ember.ObjectController.extend
  needs: ['exercises', 'profile']
  profile: Ember.computed.alias('controllers.profile.content')
  exercises: Ember.computed.alias('controllers.exercises.content')
  approvedExercises: Ember.computed.filterBy("exercises", 'approved', true)
  isSaving: false
  exercisesSorting: ["name"]
  alphabeticalExercises: Ember.computed.sort("approvedExercises", "exercisesSorting")

  actions:
    submit: -> 
      @set('isSaving', true)
      activity = @get('model')
      activity.set('user', @get('currentUser.content'))

      success = (activity) =>
        @get('profile').reload()
        @get('profile').get('activities').addObject(activity)
        @set('model', @store.createRecord('activity'))
        @set('isSaving', false)
        @set('value', null)
        WorkoutWars.get("flash").success "Your activity was created"
      failure = (response) =>
        @set('isSaving', false)
        WorkoutWars.get("flash").danger "Your activity was not created"
      
      activity.save().then success, failure