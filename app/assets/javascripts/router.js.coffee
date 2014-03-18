WorkoutWars.Router.map (match)->
  @resource "competitions", ->
    @resource "competition", path: "/:competition_id", ->
      @route "edit"
    @route "create"
    
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
    @route "challenges"
    @route "stats"

    @resource "profile.activities", ->
      @resource "activity", path: ":activity_id", ->
        @route "edit"
      @route "create"

  @resource "users", ->
    @resource "user", path: "/:user_id", ->
      
  @route "contact",
    path: "/contact"

  @route "privacy",
    path: "/privacy"

