class EventMasterApp
    require 'pry'

    def welcome 
        puts "Welcome to Eventmaster!"
        puts "Please select from the following options:"
        puts "1. New User"
        puts "2. Login"
        puts "3. Exit"
        user_input = gets.chomp #("Choose an option" ["New User", "Login", "Exit"])
        case user_input
        when "1"
            new_user
        when "2"
            login
        when '3'
            exit
        else
            print "Please type a valid option: "
            user_input = gets.chomp
        end
        # if choice == "New User" 
        #     new_user 
        # elsif choice == "Login"
        #     login 
        # else 
        #     puts "Goodbye" 
        #     exit
        # end 
    end 

    def new_user
        puts "Please select 1 if you are a User or 2 if you are event Organiser"
        user_or_organiser = gets.chomp.to_i

        if user_or_organiser == 1
            puts "Please enter your username"
            name = gets.chomp
            if User.fetch_user(name)
                puts 'Sorry this user already exists'
                puts ' Please select a different username'
                new_user
            end
            user = User.create(name: name, organiser?: false)
        elsif user_or_organiser == 2 
            puts "Please enter your name"
            name = gets.chomp.titleize
                if User.fetch_user(name)
                puts 'Sorry this user already exists'
                puts ' Please select a different username'
                new_user
                end
            user = User.create(name: name, organiser?: true)
        else
            print "Please type a valid option: "
            user_or_organiser = gets.chomp
        end
        prompt_user(user)
    end 


    def login
        puts "Please enter your username:"
        name = gets.chomp.titleize
        user = User.fetch_user(name)
        puts "Welcome back #{user.name}"
        prompt_user(user)
    end

    def prompt_user(user)

        if user.organiser?

        puts "Please select from the following options: "
        puts '1. Add a new event'
        puts "2. See my events"
        puts "3. Delete my account"
        
        user_prompt_option = gets.chomp
        case user_prompt_option 
        when "1"
            add_event(user)
        when '2'
            see_my_events(user)
        when "3"
            User.delete_user(user.name)
            puts 'User terminated...Goodbye'
            exit
        end
        else

        puts "Please select from the following options: "
        puts '1. Show available events'
        #select event
        #buy ticket
        puts "2. See my tickets"
        #select a ticket
        #write a review
        #total money spent
        puts '4. See all my reviews'
        #select a review
        #update review
        #delete review
        puts "4. Delete my account"

        end

        user_prompt_option = gets.chomp
        case user_prompt_option 
        when "1"
            all_my_tickets
        when "2"
            # Event.all
            events = Event.all
            events.each_with_index{|event, i|puts "#{i+1}. #{event.title}, #{event.address}, #{event.date}"}
            print "Select one of the listed events: "
            ticket_user_input = gets.chomp.to_i
            event_id = ticket_user_input
            puts "you have selected #{event.title}, at #{event.address}, on #{event.date}"
            puts "Would you like to buy the ticket for this event? Yes/No"
            answer_to_buy = gets.chomp.titleize
            if answer_to_buy == "Yes"
                buy_ticket(event_id)
            else
                prompt_user
            end


        when "3"
            create_review
        when "4"
            total_money_spent
        else
            print "Please type a valid option: "
            user_prompt_option = gets.chomp
        end
    end 

    def see_my_events(user)
        puts "Here are all your events!"
        events = user.select_my_events
        events.each_with_index{|event, i|puts "#{i+1}. #{event.title}, #{event.address}, #{event.date}"}
        puts 'Please select from the numbered events'
        event_id = gets.chomp.to_i 
        event_id  -= 1
        event = events[event_id]
        puts "you have selected #{event.title}, at #{event.address}, on #{event.date}"
        puts 'What would you like to do?'
        puts '1. You can update the event details'
        puts '2. You can view the reviews for the event'
        puts '3. You can make an event unavailable'
        puts '4. See whos attending the event'
        puts '5. Delete the event'

        user_prompt_option = gets.chomp
        case user_prompt_option 
        when "1"
            update_event(user, event)
            puts 'Updated. Event details changed'
            prompt_user(user)
        when '2'
            see_my_reviews(user, event)
            prompt_user(user)
        when "3"
            event.update(available?: false)
            puts 'Updated. Event no longer available'
            prompt_user(user)
        when '4'
            puts 'GuestList:'
            whos_attending(user, event)
            prompt_user(user)
        when '5'
            user.delete_my_event(event.title)
            puts 'Updated. Event deleted'
            prompt_user(user)
        end

#update
#view reviews
#set unavailable
#see whos attending

    end

   def add_event(user)
    puts 'Please enter a Title'
    title = gets.chomp
    puts 'Please enter a description'
    description = gets.chomp
    puts 'Please enter an address'
    address = gets.chomp
    puts 'Please enter an event type'
    event_type = gets.chomp
    puts 'Please enter a prcice'
    price = gets.chomp.to_i
    puts 'Please enter an date'
    date = gets.chomp
    puts 'Please select a venue'
    venues = Venue.all
    venues.each_with_index{|venue, i|puts "#{i+1}. #{venue.name}, #{venue.venue_type}, #{venue.city.name}"}
    venue_user_input = gets.chomp.to_i
    venue_id = venue_user_input
    if user.add_new_event(title, description, address, event_type, price, date, venue_id)
        puts 'New Event Created!'
    else
        puts 'Event Creation failed, please try again'
    end
    prompt_user(user)
end

def update_event(user, event)
  puts 'Please update the Title'
    title = gets.chomp
    puts 'Please update the description'
    description = gets.chomp
    puts 'Please enter a new address'
    address = gets.chomp
    puts 'Please update the event type'
    event_type = gets.chomp
    puts 'Please enter a new prcice'
    price = gets.chomp.to_i
    puts 'Please enter a new date'
    date = gets.chomp
    puts 'Please select a new venue'
    venues = Venue.all
    venues.each_with_index{|venue, i|puts "#{i+1}. #{venue.name}, #{venue.venue_type}, #{venue.city.name}"}
    venue_user_input = gets.chomp.to_i
    venue_id = venue_user_input
    if user.update_my_event(event.title, title, description, address, event_type, price, date, venue_id)
        puts 'Event Updated!'
    else
        puts 'Updating event failed, please try again'
    end
    prompt_user(user)
end

def whos_attending(user, event)
    user.my_event_atendees(event.id).map{|name| puts name}
end

def see_my_reviews(user, event)
    avg = []
    puts 'Here are the reviews for your event:'
    reviews = user.my_event_reviews(event.id)
    reviews.map{|obj| obj.each_with_index{|review, i|
        puts "#{review.description}, #{review.rating}, #{review.user.name}"
        avg.push(review.rating)
        }}
       puts "Your average rating is: #{avg.sum / avg.count}"
end
end