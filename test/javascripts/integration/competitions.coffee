module "integration tests",
  setup: ->
    Ember.run(WorkoutWars, WorkoutWars.advanceReadiness)

  teardown: ->
    WorkoutWars.reset()

test "Create new competition", ->
  visit("/competitions/create").then ->
    fillIn('input[name="Name"]', null, "Test Competition")
    fillIn('input[name="Start Date"]', null, "01/01/2014")
    fillIn('input[name="End Date"]', null, "01/14/2014")
    fillIn('input[name="Max Participants"]', null, "20")
    click("button:contains('Save')")
    andThen ->
      ok(find("h2:contains('Test Competition')").length, "The competition title should display")
      ok(find("p:contains('Start Date: Jan 1st 2014')").length, "The competition start date should display")
      ok(find("p:contains('End Date: Jan 14th 2014')").length, "The competition end date should display")
      ok(find("p:contains('This is a public competition')").length, "The competition should display that it is public")

# test "Add exercise to competition", ->
#   visit("/competitions/").then ->
#     click("a:contains('Test Competition')")
#     andThen ->
#       find('select[name="Exercise Select"] option:eq(2)').attr('selected', 'selected')
#       click("button:contains('Add Exercise')")
#     andThen ->
#       ok(find("li:contains('Pushups')").length, "The competition should display it's exercise")
#       ok(find("button:contains('Remove')").length, "The competition should display remove exercise button")

test "Create new invalid competition", ->
  visit("/competitions/create").then ->
    click("button:contains('Save')")
    andThen ->
      ok(find("span.help-block:contains(\"can't be blank\")").length == 3, "The server validations should display")