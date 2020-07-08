class Event < ApplicationRecord
    validates :date, :description, presence: true
    
    #has_many association to create and own events
    belongs_to :creator, class_name: "User"
    #has_many through association to create a many-to-association for attendees attending
    #event
    has_many :attendable_events, foreign_key: :attended_event_id
    has_many :attendees, through: :attendable_events
end
