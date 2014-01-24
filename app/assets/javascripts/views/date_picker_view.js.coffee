WorkoutWars.DateField = Ember.TextField.extend
  didInsertElement: ->
    @.$().datepicker().on 'changeDate', =>
      @.$().trigger('change')
  