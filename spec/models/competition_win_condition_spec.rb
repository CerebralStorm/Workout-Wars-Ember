require 'spec_helper'

describe CompetitionWinCondition do
  context "associations" do
    it 'should have many competitions' do
      expect(CompetitionWinCondition.reflect_on_association(:competitions)).to_not be_nil
      expect(CompetitionWinCondition.reflect_on_association(:competitions).macro).to eql(:has_many)
    end
  end
  
  context "#methods" do
    it "should require a name" do
      win_condition = FactoryGirl.build(:competition_win_condition, name: "Most completed by date")
      expect(win_condition.computing_method_call).to eq :most_completed_by_date
    end
  end

  context "compute win conditions" do
    describe "#most_completed_by_date" do 
      before do 
        @user1 = FactoryGirl.create(:user)
        @user2 = FactoryGirl.create(:user)
        @exercise = FactoryGirl.create(:exercise, name: "Pushups")
        @win_condition = FactoryGirl.create(:competition_win_condition, name: "Most completed by date")
        @competition = FactoryGirl.create(:competition, started: true, competition_win_condition: @win_condition)
        FactoryGirl.create(:competition_exercise, exercise: @exercise, competition: @competition)
        FactoryGirl.create(:competition_join, user: @user1, competition: @competition)
        FactoryGirl.create(:competition_join, user: @user2, competition: @competition)
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
    end

    describe "#highest_score_by_date" do 
      before do 
        @user1 = FactoryGirl.create(:user)
        @user2 = FactoryGirl.create(:user)
        @exercise = FactoryGirl.create(:exercise, name: "Running", experience_multiplier: 40)
        @win_condition = FactoryGirl.create(:competition_win_condition, name: "Highest score by date")
        @competition = FactoryGirl.create(:competition, started: true, competition_win_condition: @win_condition)
        FactoryGirl.create(:competition_exercise, exercise: @exercise, competition: @competition)
        FactoryGirl.create(:competition_join, user: @user1, competition: @competition)
        FactoryGirl.create(:competition_join, user: @user2, competition: @competition)
        FactoryGirl.create(:user_exercise, user: @user1, value: 5, exercise: @exercise)
        FactoryGirl.create(:user_exercise, user: @user2, value: 10, exercise: @exercise)
        @competition.update_attributes(finished: true)
      end
      it "should compute the total" do
        expect(CompetitionJoin.first.total).to eq 200
        expect(CompetitionJoin.last.total).to eq 400
      end

      it "should compute the rank" do
        expect(CompetitionJoin.first.rank).to eq 2
        expect(CompetitionJoin.last.rank).to eq 1
      end
    end
  end
end
