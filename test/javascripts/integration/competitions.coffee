module "Competition integration tests",
  setup: ->
    Ember.run WorkoutWars, WorkoutWars.advanceReadiness

  teardown: ->
    WorkoutWars.reset()

test "Can see competitions", ->
  visit("/")
  expect(0)