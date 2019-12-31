class Event < ActiveRecord::Base
    belongs_to :venue
    belongs_to :organiser
    has_many :tickets
end