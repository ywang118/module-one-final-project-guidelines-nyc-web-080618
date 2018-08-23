require 'json'
require 'pry'
require 'faker'
require 'rest-client'
#create seed events

# t.string :name
# t.text :description
# t.string :photo_url # going to remove
# t.string :location_borough
# t.datetime :time



####location_neighborhood_and_borough

event_array = []
neighborhood_and_borough_hash = []
   response_string = RestClient.get('https://data.cityofnewyork.us/api/views/swpk-hqdp/rows.json?accessType=DOWNLOAD')
   response_hash = JSON.parse(response_string)
   response_hash = response_hash["data"].shuffle
   response_string = RestClient.get('https://data.cityofnewyork.us/resource/whq7-qjbv.json')
   event = JSON.parse(response_string)


   i = 0
   100.times do
     event_array.push(event[i]["name"])
     i += 1
   end
   event_array = event_array.uniq

   i = 0
   10.times do
     neighborhood_and_borough_hash.push("#{response_hash[i][-2]}, #{response_hash[i][-6]}")
     i += 1
   end



puts "creating events"
    i = 0
    10.times do
      Event.create(name: event_array[i], description: "#{event_array[i]} with friends and some people you don't know!", location_borough: neighborhood_and_borough_hash[i], time: Faker::Time.forward(10),cost: 1+rand(100))
      i += 1
    end
puts "done with events"

# create seed organizer
# t.string :first_name
# t.string :last_name
# t.string :email_address
# t.string :phone_number


#
##name

name_hash = []
response_string = RestClient.get('http://hp-api.herokuapp.com/api/characters')
response_hash = JSON.parse(response_string)
# organizer_name_array = response_hash["results"]
response_hash.each do |name|
  name_hash.push(name["name"])
end
name_hash
##email_address
email_hash = []
name_hash.each do |names|

  email_hash.push(names.gsub(' ', '_') + "@gmail.com")
  email_hash.map!(&:downcase)
end

##phone_number

puts "making organizers"
i = 0
10.times do
  Organizer.create(full_name: name_hash[i],email_address: email_hash[i], phone_number:Faker::PhoneNumber.unique.cell_phone)
  i += 1
end


  organizer_id_arr = Organizer.all.map do |organizer|
    organizer.id
  end
  event_id_arr = Event.all.map do |event|
    event.id
  end

puts "making eventorganizer"

    # 10.times do
    #   EventOrganizer.create(event_id: event_id_arr.sample, organizer_id: organizer_id_arr.sample,
    #     is_organizer: Faker::Boolean.boolean)
    # end

  EventOrganizer.create(event_id: event_id_arr[0],organizer_id:organizer_id_arr[0], is_organizer:true)
  EventOrganizer.create(event_id: event_id_arr[0],organizer_id:organizer_id_arr[9], is_organizer:true)
  EventOrganizer.create(event_id: event_id_arr[1],organizer_id:organizer_id_arr[0], is_organizer:true)
  EventOrganizer.create(event_id: event_id_arr[2],organizer_id:organizer_id_arr[0], is_organizer:true)
  EventOrganizer.create(event_id: event_id_arr[3],organizer_id:organizer_id_arr[6], is_organizer:true)
  EventOrganizer.create(event_id: event_id_arr[4],organizer_id:organizer_id_arr[1], is_organizer:true)
  EventOrganizer.create(event_id: event_id_arr[5],organizer_id:organizer_id_arr[4], is_organizer:true)
  EventOrganizer.create(event_id: event_id_arr[6],organizer_id:organizer_id_arr[2], is_organizer:true)
  EventOrganizer.create(event_id: event_id_arr[7],organizer_id:organizer_id_arr[2], is_organizer:true)
  EventOrganizer.create(event_id: event_id_arr[8],organizer_id:organizer_id_arr[0], is_organizer:true)
  EventOrganizer.create(event_id: event_id_arr[9],organizer_id:organizer_id_arr[1], is_organizer:true)

  EventOrganizer.create(event_id: event_id_arr[0],organizer_id:organizer_id_arr[2], is_organizer:false)
  EventOrganizer.create(event_id: event_id_arr[0],organizer_id:organizer_id_arr[3], is_organizer:false)
  EventOrganizer.create(event_id: event_id_arr[0],organizer_id:organizer_id_arr[4], is_organizer:false)
  EventOrganizer.create(event_id: event_id_arr[0],organizer_id:organizer_id_arr[5], is_organizer:false)
  EventOrganizer.create(event_id: event_id_arr[0],organizer_id:organizer_id_arr[7], is_organizer:false)
  EventOrganizer.create(event_id: event_id_arr[1],organizer_id:organizer_id_arr[6], is_organizer:false)
  EventOrganizer.create(event_id: event_id_arr[2],organizer_id:organizer_id_arr[4], is_organizer:false)
  EventOrganizer.create(event_id: event_id_arr[3],organizer_id:organizer_id_arr[8], is_organizer:false)
  EventOrganizer.create(event_id: event_id_arr[4],organizer_id:organizer_id_arr[7], is_organizer:false)
  EventOrganizer.create(event_id: event_id_arr[4],organizer_id:organizer_id_arr[3], is_organizer:false)
  EventOrganizer.create(event_id: event_id_arr[5],organizer_id:organizer_id_arr[0], is_organizer:false)
  EventOrganizer.create(event_id: event_id_arr[6],organizer_id:organizer_id_arr[3], is_organizer:false)
  EventOrganizer.create(event_id: event_id_arr[6],organizer_id:organizer_id_arr[5], is_organizer:false)
  EventOrganizer.create(event_id: event_id_arr[6],organizer_id:organizer_id_arr[8], is_organizer:false)
  EventOrganizer.create(event_id: event_id_arr[8],organizer_id:organizer_id_arr[1], is_organizer:false)
  EventOrganizer.create(event_id: event_id_arr[8],organizer_id:organizer_id_arr[6], is_organizer:false)
puts "done with eventorganizer"
#create seed event organizer ie merging the two from above
