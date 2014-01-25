Feature: Competitions
  As a user, I should be able to create, join, edit, and invite for competitions

  Background:
    Given I am logged in
    And exercises exist
    And I visit the competitions page

  @javascript
  Scenario: Create a new valid competition
    When I fill out the competition with valid data
    And I save it
    Then I should see a new competition

  @javascript
  Scenario: Create a new invalid competition
    When I fill out the competition with invalid data
    And I save it
    Then I should see error messages
    When I fill out the competition with valid data
    And I save it
    Then I should see a new competition

  # @javascript
  # Scenario: Create a new valid competition and add an exercise to it
  #   When I fill out the competition with valid data
  #   And I save it
  #   Then I should see a new competition
  #   When I add an exercise to it
  #   Then I should see the new exercise
