WorkoutWars.CompetitionView = Ember.View.extend
  templateName: 'competition'

  didInsertElement: ->
    element = @.$("#competition")
    height = window.innerHeight - element.offset().top - 40
    element.css('height', height)