test "Foo always says the truth", ->
  foo = new WorkoutWars.ChallengeController()
  equal foo.cancelDelete, true, "foo.truth is not true"