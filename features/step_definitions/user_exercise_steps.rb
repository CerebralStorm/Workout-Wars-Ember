Given(/^I visit my profile page$/) do
  click_link "Profile"
end

When(/^I add two new user exercises$/) do
  select "Pushups", from: "Exercise Select"
  fill_in "Value", with: 50 
  click_button "Log it!"
  sleep 0.2 
  select "Running", from: "Exercise Select"
  fill_in "Value", with: 5 
  click_button "Log it!"
end

def activity_date(date)
  date.strftime('%m/%d/%y')
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
  within "#competitionLeaderboard" do 
    expect(page).to have_content "Hulk Hogan"
    expect(page).to have_content "1"
    expect(page).to have_content "50"
  end
end

When(/^I add an activity for the second exercise in this competition$/) do
  sleep 0.2
  click_link "New Activity"
  select "Situps", from: "Exercise Select"
  fill_in "Value", with: 50 
  click_button "Log it!"
end

Then(/^I should see my score and rank updated again$/) do
  step 'I visit the competitions page'
  step 'select my competition'
  within "#competitionLeaderboard" do 
    expect(page).to have_content "Hulk Hogan"
    expect(page).to have_content "1"
    expect(page).to have_content "100"
  end
end

Then(/^my score should be (\d+)$/) do |total|
  within "#competitionLeaderboard" do 
    expect(page).to have_content "Hulk Hogan"
    expect(page).to have_content "1"
    expect(page).to have_content "#{total}"
  end
end

When(/^I add a new user exercise$/) do
  select "Pushups", from: "Exercise Select"
  fill_in "Value", with: 50 
  click_button "Log it!"
end

Then(/^I should see the new user exercise$/) do
  within "#recent_exercises" do 
    expect(page).to have_content "50"
    expect(page).to have_content "Pushups"    
  end
end

Then(/^I should see the other new user exercise$/) do
  within "#recent_exercises" do 
    expect(page).to have_content "5"
    expect(page).to have_content "Running"    
  end
end

Then(/^I should get experience for that user exercise$/) do
  within "div.navbar-collapse" do 
    click_link "Profile"
  end

  within "#user_info" do 
    expect(page).to have_content "Experience: 50"    
  end
end

Then(/^I should see my experience for both user exercises$/) do
  within "div.navbar-collapse" do 
    click_link "Profile"
  end

  within "#user_info" do 
    expect(page).to have_content "Experience: 250"    
  end
end

When(/^I add a bad new user exercise$/) do
  select "Pushups", from: "Exercise Select"
  fill_in "Value", with: "asdf" 
end

Then(/^I should( not)? be able to submit the bad user exercise$/) do |flag|
  if flag.present?
    expect(page.has_css?("#logExercise[disabled='disabled']")).to eq true
  else
    expect(page.has_css?("#logExercise[disabled='disabled']")).to eq false
  end
end

When(/^I fix the bad user exercise$/) do
  fill_in "Value", with: "20" 
end

When(/^I add an user exercise that is not in this competition$/) do
  sleep 0.2
  select "Pullups", from: "Exercise Select"
  fill_in "Value", with: 50 
  click_button "Log it!"
end

When(/^I add another user exercise$/) do
  sleep 0.2
  select "Pushups", from: "Exercise Select"
  fill_in "Value", with: 50 
  click_button "Log it!"
end

When(/^I delete all of my user exercises$/) do
  click_link "Profile"
  click_link "Exercise History"
  3.times do 
    within "#user-exercise-calendar" do 
      sleep 0.2
      first('a[name="viewExercise"]').click
    end
    click_button "Delete"
    page.driver.browser.switch_to.alert.accept
  end
end