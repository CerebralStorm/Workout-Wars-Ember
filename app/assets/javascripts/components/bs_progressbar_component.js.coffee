WorkoutWars.BsProgressbarComponent = Ember.Component.extend
  layoutName: "components/bs-progressbar"
  classNames: ["progress-bar", "progress-bar-success"]
  attributeBindings: [
    "style"
    "role"
    "aria-valuemin"
    "ariaValueNow:aria-valuenow"
    "aria-valuemax"
  ]
  classTypePrefix: "progress-bar"
  role: "progressbar"
  "aria-valuemin": 0
  "aria-valuemax": 100
  init: ->
    @_super()

  style: (->
    "width:" + @progress + "%;"
  ).property("progress").cacheable()
  ariaValueNow: (->
    @progress
  ).property("progress").cacheable()