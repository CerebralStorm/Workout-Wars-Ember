class ExperienceSource < ActiveRecord::Base
  belongs_to :user
  belongs_to :experienceable, polymorphic: true
end
