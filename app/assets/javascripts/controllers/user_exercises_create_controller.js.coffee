WorkoutWars.UserExercisesCreateController = Ember.ObjectController.extend
  needs: ['exercises', 'profile', 'profileActivities', 'profileActivitiesCreate']
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
        @set('isSaving', false)
        @get('profile').reload()
        @get('controllers.profileActivities.content').pushObject(activity)
        @transitionToRoute('profile.activities')
        WorkoutWars.get("flash").success "Your activity was created"
      failure = (response) =>
        @set('isSaving', false)
        WorkoutWars.get("flash").danger "Your activity was not created"
      
      activity.save().then success, failure