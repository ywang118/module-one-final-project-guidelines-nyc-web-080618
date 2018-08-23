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

  def events_by_organizers
    eventorganizer =EventOrganizer.where(organizer_id: self.id, is_organizer: true)
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
    end
  end


end

# person1.update_event_time("running", "2018-08-28 02:34:15 UTC")
