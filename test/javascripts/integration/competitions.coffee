module "integration tests",
  setup: ->
    Ember.run(WorkoutWars, WorkoutWars.advanceReadiness)

  teardown: ->
    WorkoutWars.reset()

test "Sign up", ->
  visit("/users/sign_up").then ->
    debugger
    fillIn('#user_email', null, "test@test.com")