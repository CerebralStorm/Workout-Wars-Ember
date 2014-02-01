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

  context "competition calculations" do 
    before do 
      @user1 = FactoryGirl.create(:user)
      @user2 = FactoryGirl.create(:user)
      @exercise = FactoryGirl.create(:exercise, name: "Pushups", reps: true, weight: false, duration: false, calories: false, distance: false)
      @exercise2 = FactoryGirl.create(:exercise, name: "Pullups", reps: true, weight: false, duration: false, calories: false, distance: false)
      @win_condition = FactoryGirl.create(:competition_win_condition, name: "Most completed by date")
      @competition = FactoryGirl.create(:competition, started: true)
      FactoryGirl.create(:competition_exercise, exercise: @exercise, competition: @competition)
      FactoryGirl.create(:competition_join, user: @user1, competition: @competition)
      FactoryGirl.create(:competition_join, user: @user2, competition: @competition)
      FactoryGirl.create(:activity, user: @user1, reps: 100, exercise: @exercise2)
      FactoryGirl.create(:activity, user: @user2, reps: 100, exercise: @exercise2)
      FactoryGirl.create(:activity, user: @user1, reps: 50, exercise: @exercise)
      FactoryGirl.create(:activity, user: @user2, reps: 100, exercise: @exercise)
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

    it "should not record the user doing an activity that is not in the competition" do
      expect(CompetitionJoin.first.total).to eq 50
      expect(CompetitionJoin.last.total).to eq 100
    end
  end
end