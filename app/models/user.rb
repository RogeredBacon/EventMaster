class User < ActiveRecord::Base
    has_many :tickets
    has_many :reviews
    has_many :tickets, through: :events

    def self.add_new_user(name, organiser_bool)
        User.create(name: name, organiser?: organiser_bool)
    end

    def self.fetch_user(name)
        User.find_by(name: name)
    end

    def self.delete_user(name)
        user = fetch_user(name)
        User.destroy(user.id)
    end

    def add_new_event(title, description, address, event_type, price, date, venue_id)
        Event.create(title: title,
            description: description,
            address: address,
            event_type: event_type,
            price: price,
            date: date,
            available?: true,
            organiser_id: self.id,
            venue_id: venue_id,
            )
    end

    def select_my_events
        Event.where(organiser_id: self.id)
    end

        def find_my_event_title(title)
        Event.where(organiser_id: self.id, title: title)
        end

        def find_my_event_id(event_id)
        Event.where(event_id: event_id)
        end

    def update_my_event(titleold, titlenew, description, address, event_type, price, date, venue_id)
        event = find_my_event_title(titleold)
        event.update(title: titlenew,
            description: description,
            address: address,
            event_type: event_type,
            price: price,
            date: date,
            available?: true,
            organiser_id: self.id,
            venue_id: venue_id,
            )
    end

    def my_event_tickets(event_id)
        Ticket.where(event_id: event_id)
    end

    def my_event_atendees(event_id)
        my_event_tickets(event_id).collect {|ticket| ticket.user.name}
    end

    def my_event_reviews(event_id)
        ticket_id_array = my_event_tickets(event_id).collect {|e| e.id}
        ticket_id_array.map{|e| Review.all.select{|review|review.ticket_id == e }}
    end

        def delete_my_event(title)
        Event.destroy( self.find_my_event_title(title).ids)
        end

        def buy_ticket(event_id)
            Ticket.create(user_id: self.id, event_id: event_id)
        end

        def all_my_tickets
              Ticket.where(user_id: self.id)
        end

        def total_money_spent
            self.all_my_tickets.collect {|event| event.event.price}.sum
        end

        def find_my_ticket(title)
            self.all_my_tickets.select {|event| event.event.id}.first
        end

        def create_review(description, rating, ticket_id)
            Review.create(description: description,
            rating: rating,
            user_id: self.id,
            ticket_id: ticket_id
        )
        end

        def all_my_reviews
              Review.where(user_id: self.id)
        end

                def select_my_review(ticket_id)
              Review.where(user_id: self.id, ticket_id: ticket_id)
                end

            def update_my_review(title, description, rating, ticket_id)
                review = select_my_review(ticket_id)
                review.update(
                    description: description,
                    rating: rating,
                    user_id: self.id
            )
            end

        def delete_my_review(ticket_id)
            review = select_my_review(ticket_id)
            Review.destroy( review.ids)
        end

        def select_a_ticket_for_user(event_id)
            Event.all.where(event_id:event_id)
        end


end
