require 'spec_helper'

describe ChallengeAttempt do
  context "associations" do
    it 'should belong to an user' do
      ChallengeAttempt.reflect_on_association(:user).should_not be_nil
      ChallengeAttempt.reflect_on_association(:user).macro.should eql(:belongs_to)
    end

    it 'should belong to a challenge' do
      ChallengeAttempt.reflect_on_association(:challenge).should_not be_nil
      ChallengeAttempt.reflect_on_association(:challenge).macro.should eql(:belongs_to)
    end
  end

  context "validations" do
    it "should require an user" do
      FactoryGirl.build(:challenge_attempt, user: nil).should_not be_valid
    end

    it "should require a challenge" do
      FactoryGirl.build(:challenge_attempt, challenge: nil).should_not be_valid
    end

    it "should be valid with a user and competition" do
      FactoryGirl.build(:challenge_attempt).should be_valid
    end
  end
end
