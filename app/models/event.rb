class Event < ApplicationRecord
  validates :title, presence: true, length: { minimum: 4 }
  validates :description, presence: true, length: { minimum: 4 }
  validates :date, presence: true
  belongs_to :user

  has_many :event_users
  has_many :attendees, through: :event_users, source: :user

  scope :past_event, ->(date_check) { where('date < ?', date_check) }
  scope :upcoming_event, ->(date_check) { where('date > ?', date_check) }
end
