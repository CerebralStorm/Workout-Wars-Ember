Given(/^I visit the challenges page$/) do
  click_link "Challenges"
  click_link "Minute Pushups"
end

When(/^I fill out the challenge attempt with valid data$/) do
  click_link "New Attempt"
  fill_in "result", with: 50
  click_button "Submit"
end

Then(/^I should see a new challenge attempt$/) do
  within ".leaderboard" do 
    expect(find('tr')).to have_text("Result 50 User ray@bustinghosts.com")
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

When(/^I delete the new challenge attempt$/) do
  click_link "×"
  page.driver.browser.switch_to.alert.accept
end

Then(/^I should not see any challenge attempts$/) do
  expect(page).to have_content "Your attempt was deleted"
end