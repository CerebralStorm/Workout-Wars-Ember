require 'spec_helper'

describe ExerciseMetric do
  context "associations" do
    it 'should belong to a exercise' do
      ExerciseMetric.reflect_on_association(:exercise).should_not be_nil
      ExerciseMetric.reflect_on_association(:exercise).macro.should eql(:belongs_to)
    end

    it 'should belong to a metric' do
      ExerciseMetric.reflect_on_association(:metric).should_not be_nil
      ExerciseMetric.reflect_on_association(:metric).macro.should eql(:belongs_to)
    end
  end

  context "validations" do
    it "should require an exercise" do
      FactoryGirl.build(:exercise_metric, exercise: nil).should_not be_valid
    end

    it "should require a metric" do
      FactoryGirl.build(:exercise_metric, metric: nil).should_not be_valid
    end

    it "should be valid with a metric and exercise" do
      FactoryGirl.build(:exercise_metric).should be_valid
    end

    it "should not allow an exercise metric to have the same metric more than once" do
      exercise = FactoryGirl.create(:exercise)
      metric = FactoryGirl.create(:metric)
      FactoryGirl.create(:exercise_metric, exercise: exercise, metric: metric)
      expect(FactoryGirl.build(:exercise_metric, exercise: exercise, metric: metric)).to_not be_valid
    end
  end
end
