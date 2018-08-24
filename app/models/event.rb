class Event < ActiveRecord::Base
  has_many :event_organizers
  has_many :organizers, through: :event_organizers
  def self.most_popular
    event_hash = Event.joins(:event_organizers).group(:name).count
    event_hash.sort_by {|_key, value| value}.reverse.to_h
  end
  def people_who_led_event
    Organizer.joins(:event_organizers).where(event_organizers: {event_id:self.id,is_organizer:true})
  end
  def self.find_event_by_location(entered_description)
    event_array = Event.all.where(location_borough: entered_description)
  end
end
