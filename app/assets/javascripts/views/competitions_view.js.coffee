WorkoutWars.CompetitionsView = Ember.View.extend
  templateName: 'competitions'

  didInsertElement: ->
    element = @.$("#competitions")
    height = window.innerHeight - element.offset().top - 40
    element.css('height', height)