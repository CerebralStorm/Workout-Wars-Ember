class Challenge < ActiveRecord::Base
  belongs_to :exercise

  has_many :challenge_attempts, dependent: :destroy
  has_many :users, through: :challenge_attempts
end
