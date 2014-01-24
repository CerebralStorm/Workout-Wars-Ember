Given(/^I am logged in$/) do
  step 'there is a user "ray@bustinghosts.com" with password "slimer-Ecto-1"'
  step 'I visit the home page'
  step 'I try to log in with the right password'
end

Given(/^I visit the competitions page$/) do
  visit '/#/competitions'
  click_link "New Competition"
end

When(/^I fill out the competition with valid data$/) do
  fill_in 'Name', with: "Test Competition"
  fill_in 'Start Date', with: "01/01/2014"
  fill_in 'End Date', with: "01/14/2014"
  fill_in 'Max Participants', with: "20"
end

When(/^I save it$/) do
  click_button 'Save'
end

Then(/^I should see a new competition$/) do
  expect(page).to have_content "Test Competition"
  expect(page).to have_content "Start Date: Jan 1st 2014"
  expect(page).to have_content "End Date: Jan 14th 2014"
  expect(page).to have_content "Max Participants: 20"
  expect(page).to have_content "Public: true"    
end

When(/^I fill out the competition with invalid data$/) do
end

Then(/^I should see error messages$/) do
  expect(page).to have_content "can't be blank"
  expect(page).to_not have_content "Start Date: Jan 1st 2014"
  expect(page).to_not have_content "End Date: Jan 14th 2014"
  expect(page).to_not have_content "Max Participants: 20"
  expect(page).to_not have_content "Public: true" 
end