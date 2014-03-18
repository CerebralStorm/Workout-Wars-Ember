Feature: Competitions
  As a user, I should be able to create, join, edit, and invite for competitions

  Background:
    Given I am logged in
    And I visit the competitions page

  @javascript
  Scenario: Create a new valid competition
    When I fill out the competition with valid data
    And I save it
    Then I should see a new competition

  @javascript
  Scenario: Incompelte competition form
    When I don't fill out the competition form completely
    Then I should not be able to submit the competition form

  # @javascript
  # Scenario: Edit a competition
  #   When I fill out the competition with valid data
  #   And I save it
  #   Then I should see the edit and delete button
  #   When I click the "Edit" button
  #   And I modify the competition
  #   Then I should see the competition details change

  @javascript
  Scenario: Delete a competition
    When I fill out the competition with valid data
    And I save it
    Then I should see the delete button
    When I click the "Delete" button
    And I confirm
    Then I should not see the competition anymore

  @javascript
  Scenario: View a competition created by another user
    When I fill out the competition with valid data
    And I save it
    And I log out
    And I go to the sign up page
    And I fill out the form and submit
    And I go to the competition page
    Then I should not see what creators see

  @javascript
  Scenario: join and leave a competition
    When I fill out the competition with valid data
    And I save it
    Then I should see a new competition
    When I leave that competition
    Then I should be able to join again
    When I join again I should still be able to leave

  @javascript
  Scenario: join and leave a competition many times
    When I fill out the competition with valid data
    And I save it
    Then I should see a new competition
    When I leave that competition
    Then I should be able to join again
    When I join again I should still be able to leave
    When I leave that competition
    Then I should be able to join again
    When I join again I should still be able to leave

  @javascript
  Scenario: can't join a full competition
    When I fill out the competition with valid data
    And I set the max participants
    And I save it
    Then I should not be able to join again
