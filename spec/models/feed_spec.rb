require 'spec_helper'

describe Feed do

  context "associations" do
    it 'should have many user exercises' do
      Feed.reflect_on_association(:feedable).should_not be_nil
      Feed.reflect_on_association(:feedable).macro.should eql(:belongs_to)
    end
  end

  context "validations" do
    it "should require an email" do
      FactoryGirl.build(:feed, feedable: nil).should_not be_valid
    end

    it "should be valid with a user and competition" do
      exercise = FactoryGirl.build(:user_exercise)
      FactoryGirl.build(:feed, feedable: exercise).should be_valid
    end
  end
end