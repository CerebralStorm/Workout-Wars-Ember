require 'spec_helper'

describe Notification do
  context "validations" do
    it "should require a name" do
      expect(FactoryGirl.build(:notification, name: "")).to_not be_valid
    end

    it "should be valid with all fields" do
      expect(FactoryGirl.build(:notification)).to be_valid
    end
  end
end
