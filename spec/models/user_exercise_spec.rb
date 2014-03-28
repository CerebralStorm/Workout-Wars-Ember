require 'spec_helper'

describe UserExercise do
  context "associations" do
    it 'should belong to an exercise_type' do
      UserExercise.reflect_on_association(:user).should_not be_nil
      UserExercise.reflect_on_association(:user).macro.should eql(:belongs_to)
    end

    it 'should belong to an exercise' do
      UserExercise.reflect_on_association(:exercise).should_not be_nil
      UserExercise.reflect_on_association(:exercise).macro.should eql(:belongs_to)
    end

    it 'should have one experience_source' do
      UserExercise.reflect_on_association(:experience_source).should_not be_nil
      UserExercise.reflect_on_association(:experience_source).macro.should eql(:has_one)
    end

    it 'should have many competition_user_exercises' do
      UserExercise.reflect_on_association(:competition_user_exercises).should_not be_nil
      UserExercise.reflect_on_association(:competition_user_exercises).macro.should eql(:has_many)
    end
  end

  context "validations" do
    it "should require an user" do
      FactoryGirl.build(:user_exercise, user: nil).should_not be_valid
    end

    it "should require a exercise" do
      FactoryGirl.build(:user_exercise, exercise: nil).should_not be_valid
    end

    it "should be valid with a user and competition" do
      FactoryGirl.build(:user_exercise).should be_valid
    end
  end

  context "competition calculations" do 
    before do 
      @user1 = FactoryGirl.create(:user)
      @user2 = FactoryGirl.create(:user)
      @exercise = FactoryGirl.create(:exercise, name: "Pushups")
      @exercise2 = FactoryGirl.create(:exercise, name: "Pullups")
      @win_condition = FactoryGirl.create(:competition_win_condition, name: "Most completed by date")
      @competition = FactoryGirl.create(:competition, started: true)
      FactoryGirl.create(:competition_exercise, exercise: @exercise, competition: @competition)
      FactoryGirl.create(:competition_join, user: @user1, competition: @competition)
      FactoryGirl.create(:competition_join, user: @user2, competition: @competition)
      FactoryGirl.create(:user_exercise, user: @user1, value: 100, exercise: @exercise2)
      FactoryGirl.create(:user_exercise, user: @user2, value: 100, exercise: @exercise2)
      FactoryGirl.create(:user_exercise, user: @user1, value: 50, exercise: @exercise)
      FactoryGirl.create(:user_exercise, user: @user2, value: 100, exercise: @exercise)
      @competition.update_attributes(finished: true)
    end
    it "should compute the total" do
      expect(CompetitionJoin.first.total).to eq 50
      expect(CompetitionJoin.last.total).to eq 100
    end

    it "should compute the rank" do
      expect(CompetitionJoin.first.rank).to eq 2
      expect(CompetitionJoin.last.rank).to eq 1
    end

    it "should not record the user doing an user_exercise that is not in the competition" do
      expect(CompetitionJoin.first.total).to eq 50
      expect(CompetitionJoin.last.total).to eq 100
    end
  end
end