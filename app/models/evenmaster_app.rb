class EventMasterApp
    def welcome 
        puts "Welcome to Eventmaster!"
        puts "Please select from the following options:"
        puts "1. New User"
        puts "2. Login"
        puts "3. Guest"
        puts "4. Exit"
        user_input = gets.chomp #("Choose an option" ["New User", "Login", "Exit"])
        case user_input
        when "1"
            new_user
        when "2"
            login
        when "3"
            prompt_user
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
            puts "Please enter your name"
            name = gets.chomp 
            User.create(name: name)
        elsif user_or_organiser == 2 
            puts "Please enter your name"
            name = gets.chomp.titleize
            Organiser.create(name: name)
        else
            print "Please type a valid option: "
            user_or_organiser = gets.chomp
        end
        prompt_user 
    end 
    def prompt_user 
        puts "Please select from the following options: "
        puts "1. See my tickets"
        puts "2. See all events"
        puts "3. Select an event"
        puts "4. Buy a ticket"
        puts "5. Write a review"
        puts "6. Total money spent"
        
        user_prompt_option = gets.chomp
        case user_prompt_option 
        when "1"
            all_my_tickets
        when "2"
            # Event.all
            events = Event.all
            events.each_with_index{|event, i|puts "#{i+1}. #{event.title}, #{event.address}, #{event.date}, #{event.price}"}
            print "Select an option: "
            user_input = gets.chomp
        when "3"
            event_id = gets.chomp.to_i + 1
        when "4"
            buy_ticket
        when "5"
            create_review
        when "6"
            total_money_spent
        else
            print "Please type a valid option: "
            user_prompt_option = gets.chomp
        end
    end 
end







