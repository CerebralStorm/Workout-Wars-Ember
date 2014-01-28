require 'spec_helper'

describe Activity do
  context "associations" do
    it 'should belong to an exercise_type' do
      Activity.reflect_on_association(:user).should_not be_nil
      Activity.reflect_on_association(:user).macro.should eql(:belongs_to)
    end

    it 'should belong to an exercise' do
      Activity.reflect_on_association(:exercise).should_not be_nil
      Activity.reflect_on_association(:exercise).macro.should eql(:belongs_to)
    end

    it 'should have one experience_source' do
      Activity.reflect_on_association(:experience_source).should_not be_nil
      Activity.reflect_on_association(:experience_source).macro.should eql(:has_one)
    end

    it 'should have many competition_activities' do
      Activity.reflect_on_association(:competition_activities).should_not be_nil
      Activity.reflect_on_association(:competition_activities).macro.should eql(:has_many)
    end
  end

  context "validations" do
    it "should require an user" do
      FactoryGirl.build(:activity, user: nil).should_not be_valid
    end

    it "should require a exercise" do
      FactoryGirl.build(:activity, exercise: nil).should_not be_valid
    end

    it "should be valid with a user and competition" do
      FactoryGirl.build(:activity).should be_valid
    end
  end
end