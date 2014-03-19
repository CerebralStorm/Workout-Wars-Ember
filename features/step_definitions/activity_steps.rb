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
  sleep 0.2 
  select "Pushups", from: "Exercise Select"
  fill_in "Value", with: 50 
  click_button "Log it!"
end

When(/^I add two new activities$/) do
  sleep 0.2 
  select "Pushups", from: "Exercise Select"
  fill_in "Value", with: 50 
  click_button "Log it!"
  sleep 0.2 
  click_link "New Activity"
  sleep 0.2 
  select "Running", from: "Exercise Select"
  fill_in "Value", with: 5 
  click_button "Log it!"
end

def activity_date(date)
  date.strftime('%m/%d/%y')
end

Then(/^I should see the new activity$/) do
  within "#recent_activity" do 
    expect(page).to have_content "Pushups"
    expect(page).to have_content "#{activity_date(Date.today)}"
  end
end

Then(/^I should see the other new activity$/) do
  within "#recent_activity" do 
    expect(page).to have_content "Running"
    expect(page).to have_content "#{activity_date(Date.today)}"
  end
end

Then(/^I should see my experience for that activity$/) do
  click_link "Profile"
  expect(page).to have_content "Experience: 50"
end

Then(/^I should see my experience for both activities$/) do
  click_link "Profile"
  expect(page).to have_content "Experience: 250"
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
  within ".leaderboard" do 
    expect(page).to have_content "Hulk Hogan"
    expect(page).to have_content "1"
    expect(page).to have_content "50"
  end
end

When(/^I add a bad new activity$/) do
  sleep 0.2
  select "Pushups", from: "Exercise Select"  
end

Then(/^I should not be able to submit the bad activity$/) do
  assert page.has_css?("#logActivity[disabled='disabled']")
end

When(/^I add an activity that is not in this competition$/) do
  sleep 0.2
  click_link "New Activity"
  select "Pullups", from: "Exercise Select"
  fill_in "Value", with: 50 
  click_button "Log it!"
end

When(/^I add an activity for the second exercise in this competition$/) do
  sleep 0.2
  click_link "New Activity"
  select "Situps", from: "Exercise Select"
  fill_in "Value", with: 50 
  click_button "Log it!"
end

When(/^I add another activity$/) do
  click_link "Log Activity"
  sleep 0.2
  select "Pushups", from: "Exercise Select"
  fill_in "Value", with: 50 
  click_button "Log it!"
end

Then(/^I should see my score and rank updated again$/) do
  step 'I visit the competitions page'
  step 'select my competition'
  within ".leaderboard" do 
    expect(page).to have_content "Hulk Hogan"
    expect(page).to have_content "1"
    expect(page).to have_content "100"
  end
end

When(/^I delete all of my activities$/) do
  click_link "Profile"
  click_link "Activities"
  3.times do 
    within "#recent_activity" do 
      sleep 0.2
      first('a').click
    end
    click_link "Delete"
    page.driver.browser.switch_to.alert.accept
  end
end

Then(/^my score should be (\d+)$/) do |total|
  within ".leaderboard" do 
    expect(page).to have_content "Hulk Hogan"
    expect(page).to have_content "1"
    expect(page).to have_content "#{total}"
  end
end