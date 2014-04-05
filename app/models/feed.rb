class Feed < ActiveRecord::Base
  belongs_to :feedable, polymorphic: true

  validates_presence_of :feedable
end
