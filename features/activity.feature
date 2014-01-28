Feature: Activity
  As a user, I should be able to create, and delete activities

  Background:
    Given I am logged in
    And I visit my profile page

  @javascript
  Scenario: log an activity
    When I go to my activities
    And I add a new activity
    Then I should see the new activity
    And I should see my experience for that activity

  @javascript
  Scenario: log a bad activity then fix it
    When I go to my activities
    And I add a bad new activity
    Then I should see the error messages
    And I add a new activity
    Then I should see the new activity

  @javascript
  Scenario: log an activity for a competition
    And I visit the competitions page
    When I fill out the competition with valid data
    And I save it
    When I add an exercise to it
    And that competition has started
    And I visit my profile page
    When I go to my activities
    And I add a new activity
    Then I should see the new activity
    And I visit the competitions page
    And select my competition
    Then I should see my score and rank updated