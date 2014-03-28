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


  context "#methods" do
    describe "#create_user_exercise" do 
      before do 
        @user = FactoryGirl.create(:user)
        @exercise = FactoryGirl.create(:exercise)
        @challenge = FactoryGirl.create(:challenge, exercise: @exercise)
      end

      it "should create an user_exercise for the user after they complete a challenge" do 
        @challenge.challenge_attempts.create(user: @user, result: 20)
        @user.user_exercises.should_not be_empty
      end

      it "should match up the correct user_exercise" do 
        challenge_attempt = @challenge.challenge_attempts.create(user: @user, result: 20)
        expect(challenge_attempt.user_exercise).to eq @user.user_exercises.first
      end

      it "should create assign the correct value to the user_exercise created by the challenge attempt" do 
        @challenge.challenge_attempts.create(user: @user, result: 20)
        @user.user_exercises.first.value.should eq 20
      end

      it "should have the correct exercise" do 
        @challenge.challenge_attempts.create(user: @user, result: 20)
        @user.user_exercises.first.exercise.should eq @exercise
      end
    end

    describe "#destroy_user_exercise" do 
      before do 
        @user = FactoryGirl.create(:user)
        @exercise = FactoryGirl.create(:exercise)
        @challenge = FactoryGirl.create(:challenge, exercise: @exercise)
        @challenge_attempt = @challenge.challenge_attempts.create(user: @user, result: 20)
      end

      it "should create an user_exercise for the user after they complete a challenge" do 
        expect(@user.user_exercises).to_not be_empty
        @challenge_attempt.destroy
        expect(@user.user_exercises).to be_empty
      end
    end
  end
end
