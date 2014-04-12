WorkoutWars.IndexView = Ember.View.extend
  templateName: 'index'

  didInsertElement: ->
    element = @.$('#index')
    height = window.innerHeight - element.offset().top - 40
    element.css('height', height)