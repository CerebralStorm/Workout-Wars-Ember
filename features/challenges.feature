# Feature: Challenges
#   As a user, I should be able to create, join, edit, and invite for challenges

#   Background:
#     Given I am logged in
#     And I visit the challenges page

#   @javascript
#   Scenario: Create a new challenge attempt
#     When I fill out the challenge attempt with valid data
#     Then I should see a new challenge attempt
#     When I go to my profile page
#     Then I should see my challenge attempts

#   @javascript
#   Scenario: Create a new challenge attempt should create an activity for me
#     When I fill out the challenge attempt with valid data
#     Then I should see a new challenge attempt
#     When I go to my profile page
#     Then I should see an activity created for my challenge attempts

#   @javascript
#   Scenario: Delete a new challenge attempt
#     When I fill out the challenge attempt with valid data
#     Then I should see a new challenge attempt
#     When I delete the new challenge attempt
#     Then I should not see any challenge attempts