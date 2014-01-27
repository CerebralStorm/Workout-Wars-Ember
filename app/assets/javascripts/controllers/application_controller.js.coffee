WorkoutWars.ApplicationController = Ember.ObjectController.extend
  currentUser: null

  init: ->
    raw_attributes = $('meta[name="current-user"]').attr('content')
    if raw_attributes 
      attributes = JSON.parse(raw_attributes)
      @store.find("user", attributes.id).then (user) =>
        @set('currentUser', user)
