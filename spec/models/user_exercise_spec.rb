require 'spec_helper'

describe UserExercise do
  context "associations" do
    it 'should have many users' do
      UserExercise.reflect_on_association(:user).should_not be_nil
      UserExercise.reflect_on_association(:user).macro.should eql(:belongs_to)
    end

    it 'should have many exercises' do
      UserExercise.reflect_on_association(:exercise).should_not be_nil
      UserExercise.reflect_on_association(:exercise).macro.should eql(:belongs_to)
    end
  end
  
  context "validations" do
    it "should require a user" do
      expect(FactoryGirl.build(:user_exercise, user: nil)).to_not be_valid
    end

    it "should require an exercise" do
      expect(FactoryGirl.build(:user_exercise, exercise: nil)).to_not be_valid
    end

    it "should require a unique exercise" do
      exercise = FactoryGirl.create(:exercise)
      user = FactoryGirl.create(:user)
      FactoryGirl.create(:user_exercise, user: user, exercise: exercise)
      expect(FactoryGirl.build(:user_exercise, user: user, exercise: exercise)).to_not be_valid
    end

    it "should be valid with valid data" do
      expect(FactoryGirl.build(:user_exercise)).to be_valid
    end
  end
end
