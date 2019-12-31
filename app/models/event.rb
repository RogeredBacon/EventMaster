class Event < ActiveRecord::Base
    has_many :tickets
    belongs_to :venue
    belongs_to :organiser, :class_name => 'User'
end 