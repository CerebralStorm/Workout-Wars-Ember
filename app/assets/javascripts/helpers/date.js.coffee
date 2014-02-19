Ember.Handlebars.registerBoundHelper 'date', (date) ->
  if date == null then "" else moment(date).format("MMM Do YYYY")

Ember.Handlebars.registerBoundHelper 'dateTime', (date) ->
  if date == null then "" else moment(date).format("MMM Do YYYY h:mm:ss a")