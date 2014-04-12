WorkoutWars.UserView = Ember.View.extend
  templateName: 'user'

  didInsertElement: ->
    element = @.$("#user")
    width = element.width()
    element.css('width', width)
    element = @.$("#user_view")
    height = window.innerHeight - element.offset().top - 40
    element.css('height', height)