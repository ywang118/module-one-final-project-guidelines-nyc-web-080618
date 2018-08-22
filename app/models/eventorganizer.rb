class EventOrganizer < ActiveRecord::Base
  belongs_to :organizer
  belongs_to :event
end
