WorkoutWars.ApplicationView = Ember.View.extend
  classNames: ['full-height']

Ember.View.reopen
  didInsertElement: ->
    @.$().hide().fadeIn(400)
    @._super()
    
  willDestroyElement: ->
    @.$().fadeOut(400)
    @._super()
