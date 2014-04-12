WorkoutWars.UsersView = Ember.View.extend
  templateName: 'users'

  didInsertElement: ->
    element = @.$('#users')
    height = window.innerHeight - element.offset().top - 40
    element.css('height', height)
    element = @.$('#user_list')
    height = window.innerHeight - element.offset().top - 40
    element.css('height', height)