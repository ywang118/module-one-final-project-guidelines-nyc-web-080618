require_relative '../config/environment'
# Organizer.destroy_all #used when we need to clear our database
# Event.destroy_all
# EventOrganizer.destroy_all
# # # Event.find_by(name:"yes").destroy
# Organizer.where(full_name: "run").destroy
# yes= Event.create(name: "yes")
# run = Organizer.create(full_name: "run")
# EventOrganizer.create( event:yes, organizer:run,is_organizer: false)

#
# person1 = Organizer.create(full_name: "Michael Coleman",email_address: "mccoleman@gmail.com", phone_number:Faker::PhoneNumber.unique.cell_phone)
# event1 = Event.create(name: "running", location_borough: "Williamsburg, Brooklyn", time: Faker::Time.forward(10))
# event_organizer1 = EventOrganizer.create(event_id: event1.id, organizer_id: person1.id, is_organizer: true)

puts "hello! Welcome to our meetup application. Please note the following commands:"
puts "type ALL to you can see all events"
response = gets.chomp
#binding.pry
if response == "ALL"
  puts Event.all.pluck()
end





# def cancle_event(event_name)  # for attendees
#   id = Event.find_by(name: event_name).id
#   event = EventOrganizer.where(organizer: self, event_id: id)
#   if event.is_organizer == false
#     event.destroy
#   end
# end
