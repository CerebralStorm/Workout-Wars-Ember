class Challenge < ActiveRecord::Base
  belongs_to :metric

  has_many :challenge_attempts
  has_many :users, through: :challenge_attempts
end
