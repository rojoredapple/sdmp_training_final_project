class Event < ApplicationRecord
  has_many :attendees, dependent: :destroy
  accepts_nested_attributes_for :attendees

  validates :name, presence: true, length: { maximum: 50 }
  validates :start_time, presence: true
  validates :end_time, presence: true
end
