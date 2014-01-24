require 'spec_helper'

describe Competition do
  let(:competition) { FactoryGirl.create(:competition)}

  context "associations" do
    it 'should have many competition exercises' do
      Competition.reflect_on_association(:competition_exercises).should_not be_nil
      Competition.reflect_on_association(:competition_exercises).macro.should eql(:has_many)
    end

    it 'should have many competition activities' do
      Competition.reflect_on_association(:competition_activities).should_not be_nil
      Competition.reflect_on_association(:competition_activities).macro.should eql(:has_many)
    end

    it 'should have many exercises' do
      Competition.reflect_on_association(:exercises).should_not be_nil
      Competition.reflect_on_association(:exercises).macro.should eql(:has_many)
    end

    it 'should have many competition_joins' do
      Competition.reflect_on_association(:competition_joins).should_not be_nil
      Competition.reflect_on_association(:competition_joins).macro.should eql(:has_many)
    end

    it 'should have many users' do
      Competition.reflect_on_association(:users).should_not be_nil
      Competition.reflect_on_association(:users).macro.should eql(:has_many)
    end
  end
  
  context "validations" do
    it "should require a name" do
      FactoryGirl.build(:competition, name: "").should_not be_valid
    end

    it "should require a start date" do
      FactoryGirl.build(:competition, start_date: "").should_not be_valid
    end

    it "should require a end date" do
      FactoryGirl.build(:competition, end_date: "").should_not be_valid
    end

    it "should be valid with valid data" do
      FactoryGirl.build(:competition).should be_valid
    end
  end
end