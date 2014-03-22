Ember.Handlebars.registerBoundHelper 'date', (date) ->
  if date == null then "" else moment(date).format("MMM Do YYYY")

Ember.Handlebars.registerBoundHelper 'dateTime', (date) ->
  if date == null then "" else moment(date).format("MMM Do YYYY h:mm a")

Ember.Handlebars.registerBoundHelper 'shortDateTime', (date) ->
  if date == null then "" else moment(date).format("MM/DD/YY h:mm a")

Ember.Handlebars.registerBoundHelper 'time', (date) ->
  if date == null then "" else moment(date).format("h:mm a")