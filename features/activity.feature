Feature: Activity
  As a user, I should be able to create, and delete activities

  Background:
    Given I am logged in
    And exercises exist
    And I visit my profile page

  @javascript
  Scenario: Create a new valid competition
    When I go to my activities
    And I add a new one
    Then I should see the new activity