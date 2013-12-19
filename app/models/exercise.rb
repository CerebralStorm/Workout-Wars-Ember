class Exercise < ActiveRecord::Base
  def metric
    return :reps if reps?
    return :distance if distance?
    return :duration if duration?
    return :weight if weight?
    return :calories if calories?
  end
end
