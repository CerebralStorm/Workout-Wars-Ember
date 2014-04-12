WorkoutWars.ProfileView = Ember.View.extend
  templateName: 'profile'

  didInsertElement: ->
    element = @.$("#profile")
    height = window.innerHeight - element.offset().top - 40
    element.css('height', height)
