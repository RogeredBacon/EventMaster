class User < ActiveRecord::Base
    has_many :tickets
    has_many :reviews
    has_many :tickets, through: :events

    def self.add_new_user(name, organiser_bool)
        User.create(name: name, organiser?: organiser_bool)
    end

    def self.login_user(name, organiser_bool)
        User.find_by(name: name, organiser?: organiser_bool)
    end

    def self.delete_user(name, organiser_bool)
        user = login_user(name, organiser_bool)
        User.destroy(user.id)
    end
end
