class User < ApplicationRecord
  validates :username, presence: true, length: { minimum: 4 }
  has_many :events

  has_many :event_users
  has_many :attended_events, through: :event_users, source: :event
end
