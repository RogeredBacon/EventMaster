class Organiser < ActiveRecord::Base
    has_many :events
    has_many :tickets, through: :events
    has_many :users, through: :tickets

    def self.create_account(name)
        Organiser.create(name:name)
    end

    def new_event(title,description,address,ty,p,date,av,ven_id)
        Event.create(title: title, 
        description: description, 
        address: address, 
        event_type: ty, 
        price: p, 
        date_time: date, 
        available?: av, 
        organiser_id: self.id, 
        venue_id: ven_id
        )
    end

    def select_my_events
        Event.where(organiser_id: self.id)
    end

    def find_that_event(title)
        select_my_events.find_by(title:title)
    end

    def edit_my_event(title_old,title_new,description,address,ty,p,date,av,ven_id)
        event = find_that_event(title_old)
        event.update(title: title_new, 
        description: description, 
        address: address, 
        event_type: ty, 
        price: p, 
        date_time: date, 
        available?: av, 
        organiser_id: self.id, 
        venue_id: ven_id
        )
    end

    def delet_my_event(title)
       event = find_that_event(title)
       Event.destroy(event.id)
    end

end