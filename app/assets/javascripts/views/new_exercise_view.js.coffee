WorkoutWars.NewExerciseView = Ember.View.extend
  templateName: 'new_exercise'

  didInsertElement: ->
    element = @.$("#new_exercise")
    height = window.innerHeight - element.offset().top - 40
    element.css('height', height)