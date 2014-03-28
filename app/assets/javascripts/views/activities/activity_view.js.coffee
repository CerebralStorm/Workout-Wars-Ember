WorkoutWars.ActivitiesActivityView = Ember.View.extend
  didInsertElement: ->
    @set('context.controllers.activities.inChild', true)

  willDestroyElement: ->
    @set('context.controllers.activities.inChild', false)