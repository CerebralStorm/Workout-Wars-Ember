require 'spec_helper'

describe Metric do
  context "validations" do
    it "should require a name" do
      expect(FactoryGirl.build(:metric, name: "")).to_not be_valid
    end

    it "should be valid with all fields" do
      expect(FactoryGirl.build(:metric)).to be_valid
    end
  end
end
