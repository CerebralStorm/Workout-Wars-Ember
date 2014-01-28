WorkoutWars.ModalView = Ember.View.extend
  layoutName: "modal_layout"
  
  didInsertElement: ->
    Ember.run.next this, ->
      @$(".modal, .modal-backdrop").addClass "in"

  actions:
    close: ->
      view = this
      
      # use one of: transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd
      # events so the handler is only fired once in your browser
      @$(".modal, .modal-backdrop").one "transitionend", (ev) ->
        view.controller.send "close"

      @$(".modal").removeClass "in"
