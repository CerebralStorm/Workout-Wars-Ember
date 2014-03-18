Given(/^I visit the exercises page$/) do
  click_link "Exercises"
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
  expect(page).to have_content "Description: A pushup followed by a lawnmower using dumbells, all while maintaining the plank position"
  #expect(page).to have_content "Measurement: Reps"
  expect(page).to have_content "Experience Multiplier: 2"
end

When(/^that exercise is approved$/) do
  Exercise.last.update_attributes!(approved: true)
end

When(/^I reload$/) do
  page.driver.browser.execute_script %Q{
    location.reload();
  }
end

Then(/^I should be able to log an activity with that new exercisee$/) do
  step 'I reload'
  click_link "Log Activity"
  select "Man Makers", from: "Exercise Select"
  fill_in "Value", with: 50 
  click_button "Log it!"
end

Then(/^I should gain experience for it$/) do
  step 'I reload'
  click_link "Profile"
  expect(page).to have_content "Experience: 100"
end