Given(/^I visit my profile page$/) do
  click_link "Profile"
end

When(/^I go to my activities$/) do
  click_link "Activities"
end

When(/^I add a new activity$/) do
  click_link "New Activity"
  select "Pushups", from: "Exercise Select"
  fill_in "Reps", with: 50 
  click_button "Save"
end

Then(/^I should see the new activity$/) do
  within "#recent_activity" do 
    expect(page).to have_content "#{read_format_date(Date.today)}"
  end
end

Then(/^I should see my experience for that activity$/) do
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
  expect(page).to have_content "Rank: 1"
  expect(page).to have_content "Total Experience: 50"
end

When(/^I add a bad new activity$/) do
  click_link "New Activity"
  select "Pushups", from: "Exercise Select"
  click_button "Save"
end

Then(/^I should see the error messages$/) do
  expect(page).to have_content "Please enter reps for this activity."
end