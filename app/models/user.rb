class User < ActiveRecord::Base
    has_many :tickets
    has_many :reviews
    has_many :tickets, through: :events
end 