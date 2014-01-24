require 'spec_helper'

describe CompetitionExercise do
  context "associations" do
    it 'should belong to an exercise_type' do
      CompetitionExercise.reflect_on_association(:exercise).should_not be_nil
      CompetitionExercise.reflect_on_association(:exercise).macro.should eql(:belongs_to)
    end

    it 'should belong to a competition' do
      CompetitionExercise.reflect_on_association(:competition).should_not be_nil
      CompetitionExercise.reflect_on_association(:competition).macro.should eql(:belongs_to)
    end
  end

  context "validations" do
    it "should require an exercise" do
      FactoryGirl.build(:competition_exercise, exercise: nil).should_not be_valid
    end

    it "should require a competition" do
      FactoryGirl.build(:competition_exercise, competition: nil).should_not be_valid
    end

    it "should be valid with a user and competition" do
      FactoryGirl.build(:competition_exercise).should be_valid
    end
  end
end