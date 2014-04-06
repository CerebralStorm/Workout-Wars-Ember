WorkoutWars.UsersView = Ember.View.extend
  templateName: 'users'

  didInsertElement: ->
    height = window.innerHeight - (window.innerHeight * 0.25);
    $('.scroll').css('height', height)