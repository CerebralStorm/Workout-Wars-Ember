module "Users integration tests",
  setup: ->
    WorkoutWars.reset()

test "Can sign up", ->
  visit("/users/sign_up")
  fillIn("#user_email", "chuck@norris.com")
  fillIn("#user_password", "password")
  fillIn("#user_password_confirmation", "password")
  click('input[value="Sign up"]')