class Feedback < ActiveRecord::Base
  validates_presence_of :email
  validates_presence_of :subject
  validates_presence_of :content

  validates_format_of :email, with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/
  validates_length_of :content, maximum: 500
end
