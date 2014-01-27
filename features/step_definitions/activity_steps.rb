Given(/^I visit my profile page$/) do
  click_link "Profile"
end

When(/^I go to my activities$/) do
  click_link "Activities"
end

When(/^I add a new one$/) do
  click_link "New Activity"
  #select "Pushups", from: "Exercise Select" 
end

Then(/^I should see the new activity$/) do
  expect(page).to have_content ""  
end