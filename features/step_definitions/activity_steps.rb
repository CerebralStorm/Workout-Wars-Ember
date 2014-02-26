Given(/^I visit my profile page$/) do
  click_link "Profile"
end

When(/^I open log activity$/) do
  click_link "Log Activity"
end

When(/^I go to my activities page$/) do
  click_link "Activities"
end

When(/^I add a new activity$/) do  
  select "Pushups", from: "Exercise Select"
  fill_in "Value", with: 50 
  click_button "Log it!"
  click_link "Close"
end

Then(/^I should see the new activity$/) do
  within "#recent_activity" do 
    expect(page).to have_content "#{read_format_date(Date.today)}"
  end
end

Then(/^I should see my experience for that activity$/) do
  click_link "Profile"
  expect(page).to have_content "Experience: 50"
end

When(/^that competition has started$/) do
  sleep 0.5
  competition = Competition.last
  competition.started = true
  competition.save
end

Then(/^select my competition$/) do
  click_link "Test Competition"
end

Then(/^I should see my score and rank updated$/) do
  visit "/"
  visit "/#/competitions/#{Competition.last.id}"
  expect(page).to have_content "Rank: 1"
  expect(page).to have_content "Total: 50"
end

When(/^I add a bad new activity$/) do
  select "Pushups", from: "Exercise Select"  
end

Then(/^I should not be able to submit the bad activity$/) do
  assert page.has_css?("#logActivity[disabled='disabled']")
end

When(/^I add an activity that is not in this competition$/) do
  sleep 0.2
  click_link "Log Activity"
  select "Pullups", from: "Exercise Select"
  fill_in "Value", with: 50 
  click_button "Log it!"
  click_link "Close"
end

When(/^I add another activity$/) do
  click_link "Log Activity"
  select "Pushups", from: "Exercise Select"
  fill_in "Value", with: 50 
  click_button "Log it!"
  click_link "Close"
end

Then(/^I should see my score and rank updated again$/) do
  visit "/"
  visit "/#/competitions/#{Competition.last.id}"
  expect(page).to have_content "Rank: 1"
  expect(page).to have_content "Total: 100"
end

When(/^I delete all of my activities$/) do
  click_link "Profile"
  click_link "Activities"
  3.times do 
    within "#recent_activity" do 
      first('a').click
    end
    click_link "Delete"
    page.driver.browser.switch_to.alert.accept
  end
end

Then(/^my score should be (\d+)$/) do |total|
  expect(page).to have_content "Total: #{total}"
end