class User < ActiveRecord::Base
    has_many :tickets
    has_many :reviews, through: :tickets
    has_many :events, through: :tickets
    has_many :organiser, through: :events

    def self.create_account(name)
        User.create(name:name)
    end

    def self.user_login(name)
        User.find_by(name:name)
    end

    def self.delete_user(name)
        user = user_login(name)
        User.destroy(user.id)
    end

end