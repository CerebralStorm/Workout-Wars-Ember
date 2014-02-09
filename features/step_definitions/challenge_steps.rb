Given(/^I visit the challenges page$/) do
  click_link "Challenges"
  click_link "Minute Pushups"
end

When(/^I fill out the challenge attempt with valid data$/) do
  fill_in "Result", with: 50
  click_button "Record Result"
end

Then(/^I should see a new challenge attempt$/) do
  within ".leaderboard" do 
    expect(find('tr:nth-child(1)')).to have_text("Result 50 User ray@bustinghosts.com")
  end
end

When(/^I go to my profile page$/) do
  click_link "Profile"
  within ".profile-navigation" do 
    click_link "Challenges"
  end
end

Then(/^I should see my challenge attempts$/) do
  within ".challenges-panel" do 
    expect(page).to have_text("My Challenge Attempts 50 - How many pushups can you do in one minute?")
  end
end