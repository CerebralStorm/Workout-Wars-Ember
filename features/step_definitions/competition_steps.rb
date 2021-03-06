Given(/^I am logged in$/) do
  step 'there is a user "ray@bustinghosts.com" with password "slimer-Ecto-1"'
  step 'I visit the home page'
  step 'I try to log in with the right password'
end

Given(/^I visit the competitions page$/) do
  within ".navbar-collapse" do 
    click_link "Competitions"
  end
end

When(/^I fill out the competition with valid data$/) do
  click_link "Click here to start a new Competition"
  select "Most completed by date", from: "Win Condition Select"
  select "Pushups", from: "Competition Exercise Select"
  click_button "Add Exercise"
  fill_in 'Description', with: "Look ma, I'm a description"
  fill_in 'Name', with: "Test Competition"
  fill_in 'startDate', with: format_date(Date.today)
  fill_in 'endDate', with: format_date(2.weeks.from_now)
  fill_in 'maxParticipants', with: "20"
end

When(/^I fill out the high score competition with valid data$/) do
  click_link "Click here to start a new Competition"
  select "Highest score by date", from: "Win Condition Select"
  select "Pushups", from: "Competition Exercise Select"
  click_button "Add Exercise"
  select "Situps", from: "Competition Exercise Select"
  click_button "Add Exercise"
  fill_in 'Description', with: "Look ma, I'm a description"
  fill_in 'Name', with: "Test Competition"
  fill_in 'startDate', with: format_date(Date.today)
  fill_in 'endDate', with: format_date(2.weeks.from_now)
  fill_in 'maxParticipants', with: "20"
end

Then(/^I should see a new high score competition$/) do
  expect(page).to have_content "Test Competition"
  expect(page).to have_content "Highest score by date"
  expect(page).to have_content "#{read_format_date(Date.today)}"
  expect(page).to have_content "#{read_format_date(2.weeks.from_now)}"
  expect(page).to have_content "20" 
  expect(page).to have_content "Pushups" 
  expect(page).to have_content "Situps" 
end

When(/^I don't fill out the competition form completely$/) do
  click_link "Click here to start a new Competition"
  select "Most completed by date", from: "Win Condition Select"
  select "Pushups", from: "Competition Exercise Select"
  click_button "Add Exercise"
end

When(/^I click the "(.*?)" button$/) do |link|
  click_link link
end

When(/^I modify the competition$/) do
  select "Most completed by date", from: "Win Condition Select"
  fill_in 'Name', with: "Edited Test Competition"
  fill_in 'startDate', with: format_date(2.weeks.from_now)
  fill_in 'endDate', with: format_date(4.weeks.from_now)
  fill_in 'maxParticipants', with: "30"
  click_button 'Submit'
end

When(/^I set the max participants$/) do
  fill_in 'maxParticipants', with: "1"
end

def format_date(date)
  date.strftime('%m/%d/%Y')
end

def read_format_date(date)
  date.strftime("%b #{date.day.ordinalize} %Y")
end

When(/^I save it$/) do
  click_button 'Submit'
end

Then(/^I should see a new competition$/) do
  expect(page).to have_content "Test Competition"
  expect(page).to have_content "Most completed by date"
  expect(page).to have_content "#{read_format_date(Date.today)}"
  expect(page).to have_content "#{read_format_date(2.weeks.from_now)}"
  expect(page).to have_content "20"  
  expect(page).to have_content "Pushups" 
end

Then(/^I should not be able to submit the competition form$/) do
  assert page.has_css?("#competitionCreate[disabled='disabled']")
end

Then(/^I should see the delete button$/) do
  expect(page).to have_selector "a[name='Delete Competition']"
end

Then(/^I should see the competition details change$/) do
  expect(page).to have_content "Edited Test Competition"
  #Need to fix this bug at some point
  #expect(page).to have_content "#{read_format_date(2.weeks.from_now)}"
  #expect(page).to have_content "#{read_format_date(4.weeks.from_now)}"
  expect(page).to have_content "30"
  expect(page).to have_content "Public" 
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
  expect(page).to have_content "Hulk Hogan"
  expect(page).to_not have_selector "a[name='Delete Competition']"
end

When(/^I leave that competition$/) do
  click_button "Leave"
  page.driver.browser.switch_to.alert.accept
end

Then(/^I should( not)? be able to join again$/) do |negate|
  expectation = negate ? :to_not : :to
  expect(page).send(expectation, have_content("Join"))
end

When(/^I join again I should still be able to leave$/) do
  click_button "Join"
  expect(page).to have_content "Leave"
end

When(/^I breakpoint$/) do
  binding.pry
end