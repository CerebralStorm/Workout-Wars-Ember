module "Ember.js Library",
  setup: ->
    Ember.run WorkoutWars, WorkoutWars.advanceReadiness

  teardown: ->
    WorkoutWars.reset()

test "Check HTML is returned", ->
  visit("/").then ->
    ok exists(".container"), "Found HTML!"