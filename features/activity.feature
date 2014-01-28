Feature: Activity
  As a user, I should be able to create, and delete activities

  Background:
    Given I am logged in
    And I visit my profile page

  @javascript
  Scenario: log an activity
    When I go to my activities
    And I add a new one
    Then I should see the new activity
    And I should see my experience for that activity