require 'spec_helper'

describe Exercise do
  let(:exercise) { FactoryGirl.create(:exercise)}

  context "associations" do
    it 'should have many user exercises' do
      Exercise.reflect_on_association(:metric).should_not be_nil
      Exercise.reflect_on_association(:metric).macro.should eql(:belongs_to)
    end
  end
  
  context "validations" do
    it "should require a metric" do
      expect(FactoryGirl.build(:exercise, metric: nil)).to_not be_valid
    end

    it "should require an experience multiplier" do
      expect(FactoryGirl.build(:exercise, experience_multiplier: nil)).to_not be_valid
    end

    it "should require experience multiplier be a number" do
      expect(FactoryGirl.build(:exercise, experience_multiplier: "test")).to_not be_valid
    end

    it "should require experience multiplier be a positive number" do
      expect(FactoryGirl.build(:exercise, experience_multiplier: -1)).to_not be_valid
    end

    it "should be valid with valid data" do
      expect(FactoryGirl.build(:exercise)).to be_valid
    end
  end
end