
#Description
# welcome_function = welcomes user to the application
# functionality_lost = provides a list of the different things that can be accomplished
# collect user input = collects the user's choice
# running file = nested if statement that calls models on user's choice
# print_rerun option = appears after each if statement in running file to allow user to select another option
# collect_and_run_rerun = collects user input & initiates next step of command
# email helper function = collects entered email (appears in running file) to ensure email actually exists in db.


def welcome_message
  puts "Welcome to our lovely application!"
  puts ""
  puts "                                #########################################################################"
  puts "                                ##   #             #  ############## ############## #################  ##"
  puts "                                ##   # #         # #  ##             ##                    ##          ##"
  puts "                                ##   #  #       #  #  ##             ##                    ##          ##"
  puts "                                ##   #   #     #   #  ############## ##############        ##          ##"
  puts "                                ##   #    #   #    #  ##             ##                    ##          ##"
  puts "                                ##   #     # #     #  ##             ##                    ##          ##"
  puts "                                ##   #      #      #  ##             ##                    ##          ##"
  puts "                                ##   #             #  ############## ##############        ##          ##"
  puts "                                #########################################################################"
  puts ""
  puts ""
  puts "                                                 *** by Lila Wang & Michael Coleman *** "



end

def functionality_list
  puts ""
  puts "Please find a list of the available features here:"
  puts "\t 1.) Find the most popular events."
  puts "\t 2.) Find the email address of all people who have led events."
  puts "\t 3.) See a list of neighborhoods with ongoing events."
  puts "\t 4.) Search for an event by the location of the event."
  puts "\t 5.) Find an organizer by their email address."
  puts "\t 6.) As an organizer, update an event's time"
  puts "\t 7.) As an organizer, cancel an event you organized."
  puts "\t 8.) View the most experienced organizers."
  puts "\t 9.) View events led by a particular organizer."
  puts ""
  puts "Please enter the number of the task you'd like to complete or 'exit' to close application."

end

def collect_user_input
  entered_response = gets.chomp
end

def running_file(entered_response)
  if entered_response == '1'
    puts ""
    puts "Please find the most popular events below:"
    most_popular_event= Event.most_popular
    most_popular_event.each do |key, value|
      puts "#{key} = #{value}"
      print_rerun_option
      collect_and_run_rerun_option
    end
  elsif entered_response == '2'
    puts ""
    puts "Please find a list of those who have led events below:"
    puts "Name:  Email Address:"
    organizer_arr = Organizer.people_who_led_events.pluck(:full_name, :email_address)
    organizer_arr.each do |key, value|
      puts "#{key}:  #{value}"
    print_rerun_option
    collect_and_run_rerun_option
    end


  elsif entered_response == '3'
    location = Event.all.pluck(:location_borough).uniq
    puts ""
    puts "Please find a list of locations with ongoing events below:"
    puts location
    print_rerun_option
    collect_and_run_rerun_option

  elsif entered_response == '4'
    display_array = ["Name: ", "Description: ", "Location: ", "Time: ", "Cost: $"]
    puts ""
    puts "Please enter the location you'd like to see: "
    entered_description = gets.chomp
    event = Event.find_event_by_location(entered_description).pluck(:name, :description, :location_borough, :time, :cost)
    puts ""
    puts ""
    event.each do |event|
      event.each_index do |i|
        puts "#{display_array[i]}#{event[i]}"
      end
    end
    puts ""
    puts ""
    if event == []
      puts "Please enter a valid location: "
      entered_description = gets.chomp
      event = Event.find_event_by_location(entered_description).pluck(:name, :description, :location_borough, :time, :cost)
      puts ""
      puts ""
      event.each do |event|
        event.each_index do |i|
          puts "#{display_array[i]}#{event[i]}"
        end
      end
      puts ""
      puts ""
    end
    print_rerun_option
    collect_and_run_rerun_option



  elsif entered_response == '5'
    puts ""

    email = email_helper_function.email_address
    @person = Organizer.email(email).pluck(:full_name, :email_address, :phone_number)
    puts "Please find details on an organizer below: "
    puts @person
    print_rerun_option
    collect_and_run_rerun_option

  elsif entered_response == '6'
    puts ""
    email = email_helper_function.email_address
    person = Organizer.email(email).first

    puts "Please enter the name of event whose time you'd like to change: "
    event_name = gets.chomp
    puts "Please enter the time you'd like to change to: "
    new_time = gets.chomp
    message = person.update_event_time(event_name,new_time)
    if Event.find_by(name: event_name).time == new_time
      puts "your event's time was updated!"
    else
      puts "sorry, you're not the organizer"
    end
    print_rerun_option
    collect_and_run_rerun_option
    #consider adding the possibility to do it again
  elsif entered_response == '7'
    puts ""

    person = email_helper_function
    # do something where they didn't enter a valid email address
    puts "Please enter the name of your event: "
    event_name = gets.chomp
    person.cancel_event(event_name)
    puts "Your event is cancelled!"
    print_rerun_option
    collect_and_run_rerun_option

  elsif entered_response == '8'
    puts ""
    puts "Please find the most experienced Organizer"
    variable = Organizer.most_expericed_organizer
    variable.each do |name, count|
      puts "Name: #{name}, trips led: #{count}"
    end
    print_rerun_option
    collect_and_run_rerun_option

  elsif entered_response == '9'
    description_array = ["Event Name: ", "Event Description: ", "Event Location: ", "Event Time: "]
    puts ""
    email = email_helper_function.email_address
    person = Organizer.email(email).first

    variable = person.events_by_particular_organizer.pluck(:name,:description,:location_borough, :time)
    variable.each do |array|
      array.each_index do |i|
        puts "#{description_array[i]} #{array[i]}"
      end
      puts ""
    end
    print_rerun_option
    collect_and_run_rerun_option

  elsif entered_response == 'exit'
    puts "Thank you for using our program!"
  else
    puts "Sorry, please enter a valid command." #case if someone doesn't enter a valid commend
    entered_response = collect_user_input
    running_file(entered_response)
  end
end



def print_rerun_option
  puts ""
  puts ""
  puts "Would you like to select something else or exit?"
  puts "List of available commands:"
  puts "1.) Select another option"
  puts "2.) See list of commands"
  puts "3.) Exit"
end

def collect_and_run_rerun_option
  entered_response = gets.chomp
  if entered_response == "1"
    puts "Please enter the command below:"
    entered_response = collect_user_input
    running_file(entered_response)
  elsif entered_response == "2"
    functionality_list
    entered_response = collect_user_input
    running_file(entered_response)
  elsif entered_response == "3" || entered_response == "exit"
    puts "Thank you!"
    exit
  else
    puts "Invalid Command, please select from list below:"
    puts "List of available commands:"
    puts "1.) Select another option"
    puts "2.) See list of commands"
    puts "3.) Exit"
    collect_and_run_rerun_option
  end
end


def email_helper_function
  puts "Please enter a valid email address: "
  email = gets.chomp
  person = Organizer.email(email).first
  if person == nil
    email_helper_function
  else
    return person
  end
end
