require "pry"
class Organizer < ActiveRecord::Base
  has_many :event_organizers
  has_many :events, through: :event_organizers


  def self.email(email)
    Organizer.find_by(email_address: email)
  end

  def self.phone_info(phone)
    Organizer.find_by(phone_number: phone)
  end
  def update_name
    first_name = self.full_name.split[0]
    self.update(first_name: first_name)
    last_name = self.full_name.split[-1]
    self.update(last_name: last_name)
  end
  def cancle_event(event_name)  # for attendees
    event = Event.find_by(name: event_name).id
    eventorganizer =EventOrganizer.where(organizer_id: self.id, event_id: event)
    binding.pry
    if eventorganizer[0].is_organizer == false
      eventorganizer.destroy
    end
  end

  def events_by_organizer
  #  eventorganizer =EventOrganizer.where(organizer_id: self.id, is_organizer: true)
    Event.joins(:event_organizers).where(event_organizers: {organizer_id:self.id,is_organizer: true})
  end
  # add method for attendees 
  def events_by_attendee
    Event.joins(:event_organizers).where(event_organizers: {organizer_id:self.id,is_organizer: false})
  end

  def self.people_who_led_events
    people_array = []
    led_event_ids = EventOrganizer.where("is_organizer" => true)
    people_array = Organizer.where(id:led_event_ids).uniq
  end

  def update_event_time(event_name,time_to_update) # for organizers
    event_obj = Event.where(name: event_name).last
    event = Event.where(name: event_name).last.id
    eventorganizer = EventOrganizer.where(organizer_id: self.id, event_id: event)
    if eventorganizer[0].is_organizer == true
      #binding.pry
      event_obj.time = time_to_update
      event_obj.save
      # add alert#
    else
      "Sorry you are not the organizer for this event!"
    end
  end

  def self.most_expericed_organizer
    organizer_arr = Organizer.joins(:event_organizers).where(event_organizers: {is_organizer:true})
    organizer_hash = organizer_arr.group(:full_name).count
    organizer_hash.sort_by {|_key, value| value}.reverse.to_h
  end


end

# person1.update_event_time("running", "2018-08-28 02:34:15 UTC")
