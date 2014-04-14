require 'spec_helper'

describe UserNotification do
    context "associations" do
    it 'should belong to a user' do
      UserNotification.reflect_on_association(:user).should_not be_nil
      UserNotification.reflect_on_association(:user).macro.should eql(:belongs_to)
    end

    it 'should belong to a notification' do
      UserNotification.reflect_on_association(:notification).should_not be_nil
      UserNotification.reflect_on_association(:notification).macro.should eql(:belongs_to)
    end
  end

  context "validations" do
    it "should require an user" do
      FactoryGirl.build(:user_notification, user: nil).should_not be_valid
    end

    it "should require a notification" do
      FactoryGirl.build(:user_notification, notification: nil).should_not be_valid
    end

    it "should be valid with a user and notification" do
      FactoryGirl.build(:user_notification).should be_valid
    end

    it "should not allow a user to have the same notification more than once" do
      notification = FactoryGirl.create(:notification)
      user = FactoryGirl.create(:user)
      FactoryGirl.create(:user_notification, notification: notification, user: user)
      expect(FactoryGirl.build(:user_notification, notification: notification, user: user)).to_not be_valid
    end
  end
end
