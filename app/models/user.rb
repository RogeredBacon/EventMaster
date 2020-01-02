class User < ActiveRecord::Base
    has_many :tickets
    has_many :reviews, through: :tickets
    has_many :events, through: :tickets
    has_many :organiser, through: :events

    def self.create_account(name)
        User.create(name:name)
    end

    def self.user_login(name)
        User.find_by(name:name)
    end

    def self.delete_user(name)
        user = user_login(name)
        User.destroy(user.id)
    end

    def buy_ticket(event_id)
        Ticket.create(user_id:self.id,event_id:event_id)
    end

    def all_my_tickets
        Ticket.where(user_id:self.id)
    end
    
    def total_money_spent
        self.all_my_tickets.map{|event|event.event.price}.sum
    end

    def find_that_event(title)
        all_my_tickets.select{|ev| ev.event.title == title}
    end

    def find_this_ticket(event_id)
        #all_my_tickets.select{|ti| ti.event_id == event_id}
        all_my_tickets.find_by(event_id:event_id)
    end


    def write_review(event_id,description,rating,ticket_id)
        this_event = find_this_ticket(event_id)
        Review.new(description:description ,rating:rating, ticket_id:this_event.id, user_id:self.id)
    end





end