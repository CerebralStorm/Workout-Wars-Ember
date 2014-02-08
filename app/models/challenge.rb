class Challenge < ActiveRecord::Base
  belongs_to :exercise

  has_many :challenge_attempts
  has_many :users
end
