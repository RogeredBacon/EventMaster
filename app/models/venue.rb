class Venue < ActiveRecord::Base
    has_many :events
    has_many :organiser, through: :events
    belongs_to :city
end