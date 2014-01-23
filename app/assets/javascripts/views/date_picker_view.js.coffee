WorkoutWars.DateField = Ember.TextField.extend
  didInsertElement: ->
    @.$().val("")
    @.$().datepicker().on 'changeDate', =>
      @.$().trigger('change')
  