class Event < ActiveRecord::Base
  belongs_to :user
  has_many :attendees
  accepts_nested_attributes_for :attendees
end
