Given(/^I am logged in$/) do
  step 'there is a user "ray@bustinghosts.com" with password "slimer-Ecto-1"'
  step 'I visit the home page'
  step 'I try to log in with the right password'
end

Given(/^exercises exist$/) do  
  [
    {name: 'Pushups',    reps: true, distance: false,  duration: false, weight: false, calories: false, experience_multiplier: 1},
    {name: 'Pullups',    reps: true, distance: false,  duration: false, weight: false, calories: false, experience_multiplier: 1},
    {name: 'Situps',     reps: true, distance: false,  duration: false, weight: false, calories: false, experience_multiplier: 1},
    {name: 'Squats',     reps: true, distance: false,  duration: false, weight: false, calories: false, experience_multiplier: 1},
    {name: 'Lunges',     reps: true, distance: false,  duration: false, weight: false, calories: false, experience_multiplier: 1},
    {name: 'Burpees',    reps: true, distance: false,  duration: false, weight: false, calories: false, experience_multiplier: 1},
    {name: 'Running',    reps: false, distance: true,  duration: false, weight: false, calories: false, experience_multiplier: 1},
    {name: 'Biking',     reps: false, distance: true,  duration: false, weight: false, calories: false, experience_multiplier: 1},
    {name: 'Swimming',   reps: false, distance: true,  duration: false, weight: false, calories: false, experience_multiplier: 1},
    {name: 'Hiking',     reps: false, distance: true,  duration: false, weight: false, calories: false, experience_multiplier: 1}, 
    {name: 'Aerobics',   reps: false, distance: false, duration: true , weight: false, calories: false, experience_multiplier: 1}, 
    {name: 'Yoga',       reps: false, distance: false, duration: true , weight: false, calories: false, experience_multiplier: 1} 
  ].each do |exercise|
    Exercise.where(exercise).first_or_create
  end
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
  # page.execute_script '$("select[name=\'Exercise Select\'] option:eq(2)").attr("selected", "selected")'
  sleep 1
  binding.pry
  click_button "Add Exercise"
end

Then(/^I should see the new exercise$/) do
  expect(page).to have_content "Biking" 
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
  fill_in 'Start Date', with: "02/01/2014"
  fill_in 'End Date', with: "02/14/2014"
  fill_in 'Max Participants', with: "30"
  click_button 'Save'
end

Then(/^I should see the competition details change$/) do
  expect(page).to have_content "Edited Test Competition"
  expect(page).to have_content "Start Date: Feb 1st 2014"
  expect(page).to have_content "End Date: Feb 14th 2014"
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
  expect(page).to have_content "The creator has not added any exercises for this competition yet"  
  expect(page).to_not have_selector "a[name='Edit Competition']"
  expect(page).to_not have_selector "a[name='Delete Competition']"
end