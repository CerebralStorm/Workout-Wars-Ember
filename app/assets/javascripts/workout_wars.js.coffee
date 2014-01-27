#= require ./store
#= require_tree ./initializers
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views
#= require_tree ./helpers
#= require_tree ./templates
#= require_tree ./routes
#= require ./router
#= require_self
#= require bootstrap

$ ->
  if $('#EmberStart').length > 0
    WorkoutWars.advanceReadiness();
