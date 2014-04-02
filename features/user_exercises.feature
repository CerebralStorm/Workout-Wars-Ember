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
  Scenario: log two activities back to back
    When I open log user exercise
    And I add two new activities
    And I go to my activities page
    Then I should see the new user exercise
    And I should see the other new user exercise
    And I should see my experience for both activities

  @javascript
  Scenario: log a bad user exercise then fix it
    When I open log user exercise
    And I add a bad new user exercise
    Then I should not be able to submit the bad user exercise

  @javascript
  Scenario: create/delete an user exercise for a competition
    And I visit the competitions page
    When I fill out the competition with valid data
    And I save it
    And that competition has started
    And I visit my profile page
    When I open log user exercise
    And I add a new user exercise
    And I add an user exercise that is not in this competition
    And I visit the competitions page
    And select my competition
    Then I should see my score and rank updated
    When I add another user exercise
    Then I should see my score and rank updated again
    When I delete all of my activities
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
    When I open log user exercise
    And I add a new user exercise
    And I add an user exercise that is not in this competition
    And I visit the competitions page
    And select my competition
    Then I should see my score and rank updated
    When I add another user exercise
    Then I should see my score and rank updated again
    When I delete all of my activities
    And I visit the competitions page
    And select my competition
    Then my score should be 0