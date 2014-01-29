WorkoutWars.FlashView = Ember.View.extend
  templateName: "flash"
  messageBinding: "model.message"
  isEmpty: Ember.computed.empty("message")
  
  didInsertElement: ->
    @hide()  if @get("isEmpty")

  onMessageChange: (->
    (if @get("isEmpty") then @hide() else @show())
  ).observes("message")

  hide: ->
    @$().hide()

  show: ->
    @$().show()

  click: (e) ->
    e.preventDefault()
    @get("model").clear()
