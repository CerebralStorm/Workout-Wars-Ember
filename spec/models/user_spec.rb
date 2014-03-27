require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user)}

  context "associations" do
    it 'should have many user_exercises' do
      User.reflect_on_association(:user_exercises).should_not be_nil
      User.reflect_on_association(:user_exercises).macro.should eql(:has_many)
    end

    it 'should have many competition_user_exercises' do
      User.reflect_on_association(:competition_user_exercises).should_not be_nil
      User.reflect_on_association(:competition_user_exercises).macro.should eql(:has_many)
    end

    it 'should have many competition_joins' do
      User.reflect_on_association(:competition_joins).should_not be_nil
      User.reflect_on_association(:competition_joins).macro.should eql(:has_many)
    end

    it 'should have many competitions' do
      User.reflect_on_association(:competitions).should_not be_nil
      User.reflect_on_association(:competitions).macro.should eql(:has_many)
    end

    it 'should have many experience_sources' do
      User.reflect_on_association(:experience_sources).should_not be_nil
      User.reflect_on_association(:experience_sources).macro.should eql(:has_many)
    end
  end
  
  context "validations" do
  end

  context "experience" do
    it "should return my experience" do
      FactoryGirl.create(:user_exercise, user: user)
      user.experience.should == 100
    end

    it "should tell me how much xp I need for the next level" do 
      FactoryGirl.create(:user_exercise, user: user)
      user.experience_for_levelup.should == 400
    end

    it "should tell me how much xp I needed for the previous level" do 
      6.times { FactoryGirl.create(:user_exercise, user: user) }
      user.previous_level_experience.should == 500
    end

    it "should tell me the total experience needed for the next level" do 
      user.next_level_experience.should == 500
    end
  end

  context "leveling up" do
    it "should increase my level when I earn enough experience" do
      6.times { FactoryGirl.create(:user_exercise, user: user) }
      user.experience.should == 600
      user.set_level
      user.experience_level.should == 2
      user.level.should == 2
    end

    it "should reduce my level if delete enough user_exercises" do
      6.times { FactoryGirl.create(:user_exercise, user: user) }
      user.set_level
      user.experience_level.should == 2
      2.times { user.user_exercises.last.destroy }
      user.set_level
      user.level.should == 1
    end
  end

  context "competitions" do  
  end
end