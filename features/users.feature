Feature: Authentication
  As a user, I should be able to sign up, sign in, sign out, and view my profile

  Background:
    Given there is a user "ray@bustinghosts.com" with password "slimer-Ecto-1"
    And I visit the home page

  @javascript
  Scenario: Sign in with bad credentials
    When I try to log in with the wrong password
    Then I should not be logged in

  @javascript
  Scenario: Sign In
    When I try to log in with the right password
    Then I should be logged in

  @javascript
  Scenario: Sign Up
    When I go to the sign up page
    And I fill out the sign up form and submit
    Then I should be logged in

  @javascript
  Scenario: change settings
    When I try to log in with the right password
    And I go to the settings page
    And I change my settings
    And I save it
    Then my changes should be saved

  @javascript
  Scenario: Sign Out
    When I try to log in with the right password
    And I visit the home page
    And I log out
    Then I should be logged out

  Scenario: Forgot Password
    When I visit the password retrieval page
    Then I should be able to get a password reset email
    And I should be able to change my password to "5tay9uftMan"