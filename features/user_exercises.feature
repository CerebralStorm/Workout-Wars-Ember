Feature: User Exercises
  As a user, I should be able to create, and delete user exercises

  Background:
    Given I am logged in

  @javascript
  Scenario: log an user exercise
    And I add a new user exercise
    Then I should see the new user exercise
    And I should get experience for that user exercise

  @javascript
  Scenario: log two user exercises back to back
    When I add two new user exercises
    Then I should see the new user exercise
    And I should see the other new user exercise
    And I should see my experience for both user exercises

  @javascript
  Scenario: log a bad user exercise then fix it
    And I add a bad new user exercise
    Then I should not be able to submit the bad user exercise
    When I fix the bad user exercise
    Then I should be able to submit the bad user exercise

  @javascript
  Scenario: create/delete a user exercise for a competition
    And I visit the competitions page
    When I fill out the competition with valid data
    And I save it
    And that competition has started
    And I visit my profile page
    And I add a new user exercise
    And I add an user exercise that is not in this competition
    And I visit the competitions page
    And select my competition
    Then I should see my score and rank updated
    When I add another user exercise
    Then I should see my score and rank updated again
    When I delete all of my user exercises
    And I visit the competitions page
    And select my competition
    Then my score should be 0

  @javascript
  Scenario: create/delete an user exercise for a highscore competition
    And I visit the competitions page
    When I fill out the high score competition with valid data
    And I save it
    And that competition has started
    And I visit my profile page
    And I add a new user exercise
    And I add an user exercise that is not in this competition
    And I visit the competitions page
    And select my competition
    Then I should see my score and rank updated
    When I add another user exercise
    Then I should see my score and rank updated again
    When I delete all of my user exercises
    And I visit the competitions page
    And select my competition
    Then my score should be 0