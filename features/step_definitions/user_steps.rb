Given(/^there is a user "(.*?)" with password "(.*?)"$/) do |email, password|
  user = User.find_by_email(email)
  FactoryGirl.create :user, email: email, password: password, password_confirmation: password unless user
end

Given(/^I visit the home page$/) do
  visit '/'
end

When(/^I try to log in with the (.*?) password$/) do |flag|
  password = (flag == "right") ? "slimer-Ecto-1" : "staypuft"
  within "ul.nav.navbar-nav.navbar-right" do 
    click_button "Log In"
  end  
  within "#loginModal" do 
    fill_in "user_email", with: "ray@bustinghosts.com"
    fill_in "user_password", with: password
    click_button "Log In"
  end
end

Then(/^I should( not)? be logged in$/)do |negate|
  expectation = negate ? :to : :to_not
  expect(page).send(expectation, have_content('Invalid email or password.'))
end


When(/^I log out$/) do
  click_link "Logout"
end

Then(/^I should be logged out$/) do
  expect(page).to_not have_content "Settings"
end

When(/^I visit the password retrieval page$/) do
  within "ul.nav.navbar-nav.navbar-right" do 
    click_button "Log In"
  end 
  click_link "Forgot your password?"
end

Then(/^I should be able to get a password reset email$/) do
  fill_in "user_email", with: "ray@bustinghosts.com"
  click_button "Send me reset password instructions"
  ActionMailer::Base.deliveries.count.should == 1
  expect(page).to have_content "You will receive an email with instructions about how to reset your password in a few minutes."
end

Then(/^I should be able to change my password to "(.*?)"$/) do |password|
  user = User.find_by_email("ray@bustinghosts.com")
  visit edit_user_password_path(reset_password_token: user.reset_password_token)
  fill_in "user_password", with: password
  fill_in "user_password_confirmation", with: password
  click_button "Change my password"
end

When(/^I go to the sign up page$/) do
  click_link "Sign Up Now!"
end

When(/^I fill out the sign up form and submit$/) do
  within "#signupModal" do 
    fill_in "Email", with: "test@tester.com"
    fill_in "user_password", with: "testpassword"
    fill_in "user_password_confirmation", with: "testpassword"
    check "I agree to the terms and conditions above"
    click_button "Sign up"
  end
end

When(/^I go to the settings page$/) do
  click_link "Profile"
  click_link "Settings"
end

When(/^I change my settings$/) do
  fill_in "Nickname", with: "Codizle"
  fill_in "Name", with: "Cody"
  fill_in "Age", with: "29"
  fill_in "Email", with: "codizle@myNewEmail.com"
  fill_in "Height", with: "60"
  fill_in "Weight", with: "190"
end

Then(/^my changes should be saved$/) do
  expect(page).to have_content "Email: codizle@myNewEmail.com"
  expect(page).to have_content "Nickname: Codizle"
  expect(page).to have_content "Age: 29"
  expect(page).to have_content "Height: 60"
  expect(page).to have_content "Weight: 190"
end