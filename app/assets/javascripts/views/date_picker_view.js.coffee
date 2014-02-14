WorkoutWars.DateField = Ember.TextField.extend
  didInsertElement: ->
    value = @.$().val()
    if value.length > 1
      newVal = moment(value).format("MMM Do YYYY") 
      @.$().val(newVal)
    @.$().datepicker().on 'changeDate', (event) =>
      @.$().trigger('change')
  