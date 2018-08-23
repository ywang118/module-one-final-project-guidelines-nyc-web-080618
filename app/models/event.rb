class Event < ActiveRecord::Base
  has_many :event_organizers
  has_many :organizers, through: :event_organizers

  def self.most_popular
    #binding.pry
    event_hash = Event.joins(:event_organizers).group(:name).count
    event_hash.sort_by {|_key, value| value}.reverse.to_h
  end

  #
  def self.people_who_led_events
    event_array = Organizer.joins(:event_organizer)
    binding.pry
  end
  def self.find_event_by_description(entered_description)
    event_array = Event.all.where(location_borough: entered_description)
  end

end
