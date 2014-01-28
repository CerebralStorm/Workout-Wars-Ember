WorkoutWars.ModalView = Ember.View.extend
  didInsertElement: ->
    Ember.run.next this, ->
      @$(".modal, .modal-backdrop").addClass "in"


  layoutName: "modal_layout"

  actions:
    close: ->
      view = this
      
      # use one of: transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd
      # events so the handler is only fired once in your browser
      @$(".modal, .modal-backdrop").one "transitionend", (ev) ->
        view.controller.send "close"

      @$(".modal").removeClass "in"
