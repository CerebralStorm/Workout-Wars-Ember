Given(/^I visit the custom exercises page$/) do
  click_link "My Profile"
  click_link "Custom Exercises"
end

When(/^I fill out the exercise with valid data$/) do
  click_link "New Exercise"
  select "Reps", from: "Metric Select"
  fill_in "Name", with: "Man Makers"
  fill_in "Description", with: "A pushup followed by a lawnmower using dumbells, all while maintaining the plank position"
  fill_in "Experience multiplier", with: "2"
end

Then(/^I should see a new exercise$/) do
  expect(page).to have_content "Man Makers"
  expect(page).to have_content "Creator: Hulk Hogan"
  expect(page).to have_content "Description: A pushup followed by a lawnmower using dumbells, all while maintaining the plank position"
  expect(page).to have_content "Measurement: Reps"
  expect(page).to have_content "Experience Multiplier: 2"
end

Then(/^I should be able to log an activity with that new exercisee$/) do
  binding.pry
end