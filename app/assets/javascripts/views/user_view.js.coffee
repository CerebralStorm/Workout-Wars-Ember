WorkoutWars.UserView = Ember.View.extend
  templateName: 'user'

  didInsertElement: ->
    element = @.$()
    width = element.width()
    element.css('width', width)
    @.$().affix
      offset:
        top: ->
          element.css('top','100px')
          100