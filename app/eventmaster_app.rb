class EventMasterApp
    require 'pry'

    def welcome 
        puts "Welcome to Eventmaster!"
        puts "Please select from the following options:"
        puts "1. New User"
        puts "2. Login"
        puts "3. Exit"
        user_input = gets.chomp
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
        puts '4. Exit'
        
        user_prompt_option = gets.chomp
        case user_prompt_option 
        when "1"
            add_event(user)
        when '2'
            see_my_events(user)
        when "3"
            User.delete_user(user.name)
            puts 'Sorry to see you go'
            puts 'User terminated...Goodbye'
            exit
        when '4'
            puts 'Goodbye'
            exit
        end
        else

        puts "Please select from the following options: "
        puts '1. Show available events'
        puts "2. See my tickets"
        puts '3. See all my reviews'
        puts "4. Delete my account"
        puts '5. Exit'

        user_prompt_option = gets.chomp
        case user_prompt_option 
        when "1"
            show_available_events(user)
        when '2'
            see_my_tickets(user)
        when '3'
            see_my_written_reviews(user)
        when "4"
            puts 'Sorry to see you go'
            User.delete_user(user.name)
            puts 'User terminated...Goodbye'
            exit
        when '5'
            puts 'Goodbye'
            exit
        end
        end
    end

    def see_my_events(user)
        puts "Here are all your events!"
        puts 'Please select from the numbered events'
        events = user.select_my_events
        events.each_with_index{|event, i|puts "#{i+1}. #{event.title}, #{event.address}, #{event.date}"}
        ticket_id = gets.chomp.to_i 
        ticket_id  -= 1
        event = events[ticket_id]
        puts "you have selected #{event.title}, at #{event.address}, on #{event.date}"
        puts 'What would you like to do?'
        puts '1. You can update the event details'
        puts '2. You can view the reviews for the event'
        puts '3. You can make an event unavailable'
        puts '4. See whos attending the event'
        puts '5. Delete the event'
        puts '0. Go back'

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
        when '0'
            prompt_user(user)
        end

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
    reviews = user.my_event_reviews(event.id)
    if reviews.count > 0
    puts 'Here are the reviews for your event:'
    reviews.map{|obj| obj.each_with_index{|review, i|
        puts "#{review.description}, #{review.rating}, #{review.user.name}"
        avg.push(review.rating)
        }}
       puts "Your average rating is: #{avg.sum / avg.count}"
    else
        puts 'Sorry this event has no reviews yet :('
    end
end

def show_available_events(user)
    puts "Here are all the available events!"
    puts 'Please select from the events you want to view'
    events = Event.all.where(available?: true)
    events.each_with_index{|event, i|puts "#{i+1}. #{event.title}, #{event.address}, #{event.date}, #{event.price}"}
        ticket_id = gets.chomp.to_i 
        ticket_id  -= 1
        event = events[ticket_id]
        puts "The event is called #{event.title}"
        puts "The event is about #{event.description}"
        puts "The event is at #{event.address}"
        puts "The events type #{event.event_type}"
        puts "The event is priced at £#{event.price}"
        puts "The event is happening on #{event.date}"
        puts "The event is happening at the #{event.venue.name} venue"
        puts "The event is in the city of #{event.venue.city.name}"

        puts "\nWhat would you like to do?"
        puts '1. Buy a ticket for this event?'
        puts '0. Go back'

        user_prompt_option = gets.chomp
        case user_prompt_option 
        when "1"
            user.buy_ticket(event.id)
            puts 'Ticket bought! See you there.'
            prompt_user(user)
        when '0'
            prompt_user(user)
        end


end

def see_my_tickets(user)
    puts "Here are all of your tickets!"
    puts 'Please select the ticket you want to view'
    tickets = Ticket.all.where(user_id: user.id)
    tickets.each_with_index{|ticket, i|puts "#{i+1}. #{ticket.event.title}, #{ticket.event.address}, #{ticket.event.date}, #{ticket.event.price}"}
        puts "\nYou've spent £#{user.total_money_spent} in total on tickets."
        ticket_id = gets.chomp.to_i 
        ticket_id  -= 1
        ticket = tickets[ticket_id]

        puts "\nWhat would you like to do?"
        puts '1. Would you like to write a review this event?'
        puts '0. Go back'

        user_prompt_option = gets.chomp
        case user_prompt_option 
        when "1"
            write_a_review(user, ticket)
            puts 'Ticket reviewed! Thanks for your feedback.'
            prompt_user(user)
        when '0'
            prompt_user(user)
        end
end

def see_my_written_reviews(user)
    puts "Here are all of your reviews!"
    puts 'Please select the review you want to change'
    reviews = user.all_my_reviews
    reviews.each_with_index{|review, i|puts "#{i+1}. #{review.description}, #{review.rating}, #{review.ticket.event.title}, #{review.ticket.event.price}"}
        review_id = gets.chomp.to_i 
        review_id  -= 1
        review = reviews[review_id]
        puts "\nWhat would you like to do?"
        puts '1. Would you like to edit the review for this event?'
        puts '2. Would you like to delete the review for this event?'
        puts '0. Go back'

        user_prompt_option = gets.chomp
        case user_prompt_option 
        when "1"
            edit_a_review(user, review)
            puts 'Review changed! Thanks for your feedback.'
            prompt_user(user)
        when '2'
            user.delete_my_review(review.ticket_id)
            puts 'Review deleted!'
            prompt_user(user)
        when '0'
            prompt_user(user)
        end
end

def write_a_review(user, ticket)
    puts 'Please provide feedback on the event'
    description = gets.chomp
    puts 'Please rate this event out of 5'
    rating = gets.chomp.to_f
    user.create_review(description, rating, ticket.id)
end

    def edit_a_review(user, review)
        puts 'Please update your feedback'
        description = gets.chomp
        puts 'Please update your rating'
        rating = gets.chomp
        user.update_my_review(description, rating, review.ticket_id)
    end
end