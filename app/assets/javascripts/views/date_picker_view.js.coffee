WorkoutWars.DatePicker = Ember.View.extend
  attributes: ["monthsFull", "monthsShort", "weekdaysFull", "weekdaysShort", "monthPrev", "monthNext", "showMonthsFull", "showWeekdaysShort", "today", "clear", "format", "formatSubmit", "hiddenSuffix", "firstDay", "monthSelector", "yearSelector", "dateMin", "dateMax", "datesDisabled", "disablePicker"]
  events: ["onOpen", "onClose", "onSelect", "onStart"]
  type: "text"
  tagName: "input"
  classNames: "pickadate ember-text-field form-control"

  click: (event) ->
    options = {}
    self = this

    @get("events").forEach (event) ->
      options[event] = self[event]  if self[event]

    @get("attributes").forEach (attr) ->
      options[attr] = self[attr]  if self[attr] isnt `undefined`

    @$().pickadate options