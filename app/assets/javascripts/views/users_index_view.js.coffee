WorkoutWars.UsersIndexView = Ember.View.extend
  templateName: 'users/index'

  didInsertElement: ->
    element = @.$("#user_index")
    height = window.innerHeight - element.offset().top - 40
    element.css('height', height)