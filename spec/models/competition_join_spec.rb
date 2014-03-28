require 'spec_helper'

describe CompetitionJoin do
  context "associations" do
    it 'should belong to a user' do
      CompetitionJoin.reflect_on_association(:user).should_not be_nil
      CompetitionJoin.reflect_on_association(:user).macro.should eql(:belongs_to)
    end

    it 'should belong to a competition' do
      CompetitionJoin.reflect_on_association(:competition).should_not be_nil
      CompetitionJoin.reflect_on_association(:competition).macro.should eql(:belongs_to)
    end
  end

  context "validations" do
    it "should require an user" do
      FactoryGirl.build(:competition_join, user: nil).should_not be_valid
    end

    it "should require a competition" do
      FactoryGirl.build(:competition_join, competition: nil).should_not be_valid
    end

    it "should be valid with a user and competition" do
      FactoryGirl.build(:competition_join).should be_valid
    end

    it "should not allow a competition to have the same exercise more than once" do
      comp = FactoryGirl.create(:competition)
      user = FactoryGirl.create(:user)
      FactoryGirl.create(:competition_join, competition: comp, user: user)
      expect(FactoryGirl.build(:competition_join, competition: comp, user: user)).to_not be_valid
    end

    it "should not allow users to join a full competition" do 
      comp = FactoryGirl.create(:competition, max_participants: 5)
      5.times { FactoryGirl.create(:competition_join, competition: comp) }
      expect(FactoryGirl.build(:competition_join, competition: comp)).to_not be_valid
    end

    it "should allow users to join if no max_participants" do 
      comp = FactoryGirl.create(:competition, max_participants: nil)
      5.times { FactoryGirl.create(:competition_join, competition: comp) }
      expect(FactoryGirl.build(:competition_join, competition: comp)).to be_valid
    end
  end

  context "user_exercises" do
    it "should count my user_exercises toward my competitions" do
      user = FactoryGirl.create(:user)
      competition = FactoryGirl.create(:competition, started: true)
      exercise = FactoryGirl.create(:exercise)
      FactoryGirl.create(:competition_exercise, competition: competition, exercise: exercise)
      FactoryGirl.create(:competition_join, user: user, competition: competition)      
      user_exercise = FactoryGirl.create(:user_exercise, exercise: exercise, user: user)
      expect(CompetitionJoin.last.total).to eq 100
    end
  end

  context "rank" do 
    it "should set my default rank when I join" do 
      user = FactoryGirl.create(:user)
      competition = FactoryGirl.create(:competition, started: true)
      FactoryGirl.create(:competition_join, user: user, competition: competition)
      expect(CompetitionJoin.last.rank).to eq 1
    end
  end
end