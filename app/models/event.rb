class Event < ApplicationRecord
    validates :date, :description, presence: true
    
    #has_many association to create and own events
    belongs_to :creator, class_name: "User"
    # belongs_to :invitable, polymorphic: true
    #has_many through association to create a many-to-association for attendees attending
    #event
    has_many :invitations, foreign_key: :attended_event_id
    has_many :attendees, through: :invitations
    
    scope :past_events, -> {where("date < ?", Date.today)}
    scope :upcoming_events, -> {where("date >= ?", Date.today)}
end
