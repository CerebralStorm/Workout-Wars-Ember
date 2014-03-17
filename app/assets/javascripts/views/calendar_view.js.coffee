WorkoutWars.EventView = Ember.Calendar.EventView.extend(
  templateName: (->
    @get("event.template") or "ember-calendar-event"
  ).property("event.template")
  classNameBindings: [
    "facebook"
    "google"
    "spoton"
  ]
  spoton: (->
    @get("event.type") is 0
  ).property("event.type")
  google: (->
    @get("event.type") is 1
  ).property("event.type")
  facebook: (->
    @get("event.type") is 2
  ).property("event.type")
)