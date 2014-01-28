Given(/^I visit my profile page$/) do
  click_link "Profile"
end

When(/^I go to my activities$/) do
  click_link "Activities"
end

When(/^I add a new one$/) do
  click_link "New Activity"
  select "Pushups", from: "Exercise Select"
  click_button "Add Exercise"
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