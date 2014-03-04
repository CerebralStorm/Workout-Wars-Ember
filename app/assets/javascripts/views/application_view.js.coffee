WorkoutWars.ApplicationView = Ember.View.extend
  classNames: ['full-height']

Ember.View.reopen
  didInsertElement: ->
    @.$().hide().slideToggle(400)
    @._super()
    
  willDestroyElement: ->
    @.$().slideToggle(250)
    @._super()
