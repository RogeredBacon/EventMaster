class User < ActiveRecord::Base
    has_many :tickets
    has_many :reviews, through: :tickets
    has_many :events, through: :tickets
    has_many :organiser, through: :events
end