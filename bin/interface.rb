def welcome_message
  puts "Welcome to our lovely application!"
end

def functionality_list
  puts ""
  puts "Please find a list of the available features here:"
  puts "\t 1.) Find the most popular event."
  puts "\t 2.) Find a list of all people who have led events."
  puts "\t 3.) Search for an event by the location of the event."
  puts "\t 4.) Find an organizer by their email address."
  puts "\t 5.) Find an organizer by their phone number."
  puts "\t 6.) As an organizer, update information about an event you organized."
  puts "\t 7.) As an organizer, cancel an event you organized."
  puts "\t 8.) Find a list of all event organizers."
  puts "\t 9.) As an organizer, update an event's time."
  puts ""
  puts "Please enter the number of the task you'd like to complete or 'exit' to ."

end

def collect_user_input
  entered_response = gets.chomp
end

def running_file(entered_response)
  if entered_response == '1'
    puts "you put 1"
  elsif entered_response == '2'
    puts "you put 2"
  elsif entered_response == '3'
    puts "you put 3"
  elsif entered_response == '4'
    puts "you put 4"
  elsif entered_response == '5'
    puts "you put 5"
  elsif entered_response == '6'
    puts "you put 6"
  elsif entered_response == '7'
    puts "you put 7"
  elsif entered_response == '8'
    puts "you put 8"
  elsif entered_response == '9'
    puts "you put 9"
  elsif entered_response == 'exit'
    puts "Thank you for using our program!"
  else
    puts "Sorry, please enter a valid command." #case if someone doesn't enter a valid commend
    entered_response = collect_user_input
    running_file(entered_response)
  end
end
