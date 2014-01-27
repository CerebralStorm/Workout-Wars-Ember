class CompetitionJoin < ActiveRecord::Base
  belongs_to :user
  belongs_to :competition

  validates_presence_of :user
  validates_presence_of :competition
  validates_uniqueness_of :user_id, scope: :competition_id
  validate :max_number_of_participants

  def max_number_of_participants
    return unless competition && competition.max_participants.present?
    if (competition.number_of_participants + 1) > competition.max_participants
      errors.add(:competition, "is full")
    end
  end
end