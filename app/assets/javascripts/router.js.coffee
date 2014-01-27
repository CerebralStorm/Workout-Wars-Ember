WorkoutWars.Router.map (match)->
  @resource "competitions", ->
    @resource "competition", path: "/:competition_id", ->
      @route "edit"
    @route "create"
    
  @resource "challenges", ->
    @resource "challenge", path: ":challenge_id", ->
      @route "edit"
    @route "create"

  @resource "users", ->
    @resource "user", path: "/:user_id", ->
        @route "edit",
        @route "competitions", 
        @route "challenges",
        @resource "activities", ->
          @resource "activity", path: ":activity_id", ->
            @route "edit"
          @route "create"
      
  @route "contact",
    path: "/contact"

