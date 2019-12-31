class Organiser < ActiveRecord::Base
    has_many :events
    has_many :tickets, through: :events
    has_many :users, through: :tickets
end