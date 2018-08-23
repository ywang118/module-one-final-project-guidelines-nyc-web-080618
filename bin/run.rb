require_relative '../config/environment'
require_relative 'interface'

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
# event_organizer1 = EventOrganizer.create(event_id: event1.id, organizer_id: person1.id, is_organizer: false)
#

binding.pry

#
# welcome_message
# functionality_list
# entered_response = collect_user_input
# running_file(entered_response)
