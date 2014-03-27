WorkoutWars.Router.map (match)->
  @resource "competitions", ->
    @route "create"
    
  @resource "competition", path: "competitions/:competition_id", ->
    @route "edit"
    
  @resource "challenges", ->
    @resource "challenge", path: ":challenge_id", ->
      @route "edit"
      @route "newAttempt"
    @route "create"

  @resource "exercises", ->
    @resource "exercise", path: ":exercise_id", ->
      @route "edit"
    @route "create"

  @resource 'profile', path: "profile/:user_id", ->
    @route "edit"
    @route "competitions"
    @route "exercises"
    @route "challenges"
    @route "stats"
    @route "accolades"

  @resource "activities", path: "/activities", ->
    @route "activity", path: ":activity_id"

  @resource "users", ->
    @resource "user", path: "/:user_id", ->
      
  @route "contact",
    path: "/contact"

  @route "privacy",
    path: "/privacy"

