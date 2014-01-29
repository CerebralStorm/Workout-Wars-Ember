WorkoutWars.ModalFlashModel = Ember.Object.extend
  type: null
  message: null
  isWarning: Ember.computed.equal("type", "warning")
  isSuccess: Ember.computed.equal("type", "success")
  isInfo: Ember.computed.equal("type", "info")
  isDanger: Ember.computed.equal("type", "danger")
  
  clear: ->
    @update null, null

  update: (type, message) ->
    @set "type", type
    @set "message", message

  warning: (message) ->
    @update "warning", message

  success: (message) ->
    @update "success", message

  info: (message) ->
    @update "info", message

  danger: (message) ->
    @update "danger", message

  

WorkoutWars.set('modalFlash', WorkoutWars.ModalFlashModel.create())

