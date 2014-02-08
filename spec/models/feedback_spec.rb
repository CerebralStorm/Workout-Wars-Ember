require 'spec_helper'

describe Feedback do
  context "validations" do
    it "should require an email" do
      FactoryGirl.build(:feedback, email: nil).should_not be_valid
    end

    it "should require a valid email" do
      FactoryGirl.build(:feedback, email: "test@test").should_not be_valid
    end

    it "should require a subject" do
      FactoryGirl.build(:feedback, subject: nil).should_not be_valid
    end

    it "should require a content" do
      FactoryGirl.build(:feedback, content: nil).should_not be_valid
    end

    it "should be valid with a user and competition" do
      FactoryGirl.build(:feedback).should be_valid
    end
  end
end
