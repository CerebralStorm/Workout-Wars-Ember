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
      expect(FactoryGirl.build(:competition, name: "")).to_not be_valid
    end

    it "should require a start date" do
      expect(FactoryGirl.build(:competition, start_date: nil)).to_not be_valid
    end

    it "should require a end date" do
      expect(FactoryGirl.build(:competition, end_date: nil)).to_not be_valid
    end

    it "should be valid with valid data" do
      expect(FactoryGirl.build(:competition)).to be_valid
    end

    it "should not be valid without a creator" do
      expect(FactoryGirl.build(:competition, user: nil)).to_not be_valid
    end

    it "should not be valid without a win condition" do
      expect(FactoryGirl.build(:competition, competition_win_condition: nil)).to_not be_valid
    end
  end

  context ".methods" do 
    describe ".start_competitions" do 
      it "should start competitions whose start time is before now" do 
        FactoryGirl.create(:competition, start_date: 1.day.ago)
        Competition.start_competitions
        expect(Competition.last.started).to eq true
      end

      it "should not start competitions whose start time is later than now" do 
        FactoryGirl.create(:competition, start_date: 1.hour.from_now)
        Competition.start_competitions
        expect(Competition.last.started).to eq false
      end
    end

     describe ".finish_competitions" do 
      it "should not finish competitions whose finish time is after now" do 
        FactoryGirl.create(:competition, start_date: Time.now, end_date: 1.hour.from_now)        
        Competition.finish_competitions
        expect(Competition.last.finished).to eq false
      end

      it "should finish competitions whose finish time is later than now" do 
        FactoryGirl.create(:competition, start_date: 2.hours.ago, end_date: 1.hour.ago).save(validate: false)
        Competition.finish_competitions
        expect(Competition.last.finished).to eq true
      end
    end
  end

  context "#methods" do 
    describe 'number_of_participants' do 
      it "should return the number of users for the competition" do 
        comp = FactoryGirl.create(:competition)
        10.times { FactoryGirl.create(:competition_join, competition: comp) }
        expect(comp.number_of_participants).to eq 10
      end
    end
  end
end