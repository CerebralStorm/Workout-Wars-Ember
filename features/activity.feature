Feature: Activity
  As a user, I should be able to create, and delete activities

  Background:
    Given I am logged in
    And I visit my profile page

  @javascript
  Scenario: log an activity
    When I open log activity
    And I add a new activity
    And I go to my activities page
    Then I should see the new activity
    And I should see my experience for that activity

  @javascript
  Scenario: log two activities back to back
    When I open log activity
    And I add two new activities
    And I go to my activities page
    Then I should see the new activity
    And I should see the other new activity
    And I should see my experience for both activities

  @javascript
  Scenario: log a bad activity then fix it
    When I open log activity
    And I add a bad new activity
    Then I should not be able to submit the bad activity

  @javascript
  Scenario: create/delete an activity for a competition
    And I visit the competitions page
    When I fill out the competition with valid data
    And I save it
    And that competition has started
    And I visit my profile page
    When I open log activity
    And I add a new activity
    And I add an activity that is not in this competition
    And I visit the competitions page
    And select my competition
    Then I should see my score and rank updated
    When I add another activity
    Then I should see my score and rank updated again
    When I delete all of my activities
    And I visit the competitions page
    And select my competition
    Then my score should be 0