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
  fill_in 'Start Date', with: format_date(Date.today)
  fill_in 'End Date', with: format_date(2.weeks.from_now)
  fill_in 'Max Participants', with: "20"
end

When(/^I set the max participants$/) do
  fill_in 'Max Participants', with: "1"
end

def format_date(date)
  date.strftime('%m/%d/%Y')
end

def read_format_date(date)
  date.strftime("%b #{date.day.ordinalize} %Y")
end

When(/^I save it$/) do
  click_button 'Save'
end

Then(/^I should see a new competition$/) do
  expect(page).to have_content "Test Competition"
  expect(page).to have_content "Start Date: #{read_format_date(Date.today)}"
  expect(page).to have_content "End Date: #{read_format_date(2.weeks.from_now)}"
  expect(page).to have_content "Max Participants: 20"
  expect(page).to have_content "This is a public competition"    
end

When(/^I fill out the competition with invalid data$/) do
end

Then(/^I should see error messages$/) do
  expect(page).to have_content "can't be blank"
  expect(page).to_not have_content "Start Date: Jan 1st 2014"
  expect(page).to_not have_content "End Date: Jan 14th 2014"
  expect(page).to_not have_content "Max Participants: 20"
  expect(page).to_not have_content "This is a public competition" 
end

When(/^I add an exercise to it$/) do
  select "Pushups", from: "Exercise Select"
  click_button "Add Exercise"
end

Then(/^I should see the new exercise$/) do
  expect(page).to have_content "Pushups" 
end

Then(/^I should see the edit and delete button$/) do
  expect(page).to_not have_selector "a[name='Edit Competition']"
  expect(page).to_not have_selector "a[name='Delete Competition']"
end

When(/^I click the "(.*?)" button$/) do |link|
  click_link link
end

When(/^I modify the competition$/) do
  fill_in 'Name', with: "Edited Test Competition"
  fill_in 'Start Date', with: format_date(2.weeks.from_now)
  fill_in 'End Date', with: format_date(4.weeks.from_now)
  fill_in 'Max Participants', with: "30"
  click_button 'Save'
end

Then(/^I should see the competition details change$/) do
  expect(page).to have_content "Edited Test Competition"
  expect(page).to have_content "Start Date: #{read_format_date(2.weeks.from_now)}"
  expect(page).to have_content "End Date: #{read_format_date(4.weeks.from_now)}"
  expect(page).to have_content "Max Participants: 30"
  expect(page).to have_content "This is a public competition" 
end


When(/^I confirm$/) do
  page.driver.browser.switch_to.alert.accept
end

Then(/^I should not see the competition anymore$/) do
  expect(page).to_not have_content "Test Competition"
end

When(/^I go to the competition page$/) do
  click_link "Competitions"
  click_link "Test Competition"
end

Then(/^I should not see what creators see$/) do 
  expect(page).to have_content "Creator: ray@bustinghosts.com"
  expect(page).to have_content "No exercises have been added to this competition."  
  expect(page).to_not have_selector "a[name='Edit Competition']"
  expect(page).to_not have_selector "a[name='Delete Competition']"
end

When(/^I leave that competition$/) do
  click_button "Leave this competition"
  page.driver.browser.switch_to.alert.accept
end

Then(/^I should( not)? be able to join again$/) do |negate|
  expectation = negate ? :to_not : :to
  expect(page).send(expectation, have_content("Join this competition"))
end

When(/^I join again I should still be able to leave$/) do
  click_button "Join this competition"
  expect(page).to have_content "Leave this competition"
end

When(/^I breakpoint$/) do
  binding.pry
end