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

  if $('#user_agree_to_terms').length > 0
    console.log $('#sign_up_form_button')
    $('#sign_up_form_button').attr("disabled", "disabled")
    $('#user_agree_to_terms').click ->
      if $('#user_agree_to_terms').is(":checked")
        $('#sign_up_form_button').attr("disabled", false) 
      else
        $('#sign_up_form_button').attr("disabled", "disabled")
