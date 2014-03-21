WorkoutWars.ProfileActivitiesCreateView = Ember.View.extend
  didInsertElement: ->
    @set('context.controllers.profileActivities.inChild', true)

  willDestroyElement: ->
    @set('context.controllers.profileActivities.inChild', false)