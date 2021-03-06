# Feature: Exercises
#   As a user, I should be able to create, edit, and delete exercises and competitions/challenges with those exercises

#   Background:
#     Given I am logged in
#     And I visit the exercises page

#   @javascript
#   Scenario: Create a new valid exercise
#     When I fill out the exercise with valid data
#     And I save it
#     Then I should see a new exercise
#     When that exercise is approved
#     Then I should be able to log an activity with that new exercisee
#     And I should gain experience for it