class User < ApplicationRecord
    validates :email, uniqueness: true
    #has_many association to create and own events
    has_many :events, foreign_key: "creator_id", class_name: "Event", dependent: :destroy
    #has_many through association to create a many-to-association for attendees attending
    #event
    has_many :attendable_events, foreign_key: :attendee_id
    has_many :attended_events, through: :attendable_events, source: :attended_event
end

