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
            User.create(name: name, organiser?: false)
        elsif user_or_organiser == 2 
            puts "Please enter your name"
            name = gets.chomp.titleize
            User.create(name: name, organiser?: true)
        else
            print "Please type a valid option: "
            user_or_organiser = gets.chomp
        end
        prompt_user 
    end 


    def login
        puts "Please enter your username:"
        name = gets.chomp.titleize
        user = User.fetch_user(name,false)
        puts "Welcome back #{user.name}"

    end

    def prompt_user 
        puts "Please select from the following options: "
        puts "1. See my tickets"
        puts "2. See all events"
        # puts "3. Select an event"
        #puts "4. Buy a ticket"
        puts "3. Write a review"
        puts "4. Total money spent"
        
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
            event_id = ticket_user_input - 1
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



end 