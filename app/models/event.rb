class Event < ActiveRecord::Base
    belongs_to :organiser, :class_name => "User"
    belongs_to :venue
    has_many :tickets

    def add_new_event()
        Event.create()
    end
end
