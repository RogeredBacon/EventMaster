# require 'faker'

# 10.times do
#     User.create(name: Faker::Name.unique.name)
# end

# 10.times do
#     Organiser.create(name: Faker::Name.unique.name)
# end

# 5.times do 
#     City.create(name: Faker::Address.city)
# end

# 15.times do 
#     Venue.create(name: Faker::FunnyName.name, venue_type:Faker::Space.planet, city_id:0)
# end


User.create(name: 'Barry')
User.create(name: 'Jerry')
User.create(name: 'Perry')
User.create(name: 'Polly')
User.create(name: 'Sally')
User.create(name: 'Larry')
User.create(name: 'Steve')

Organiser.create(name: 'Mike')
Organiser.create(name: 'Georg')
Organiser.create(name: 'Sam')
Organiser.create(name: 'Tom')
Organiser.create(name: 'Sacha')
Organiser.create(name: 'Marry')
Organiser.create(name: 'Micheal')


Ticket.create(user_id: 1, event_id: 1)
Ticket.create(user_id: 5, event_id: 2)
Ticket.create(user_id: 2, event_id: 1)
Ticket.create(user_id: 3, event_id: 2)
Ticket.create(user_id: 4, event_id: 4)
Ticket.create(user_id: 7, event_id: 5)
Ticket.create(user_id: 6, event_id: 3)

Review.create(description: 'Quiet good', rating: 3, user_id: 1, ticket_id: 1)
Review.create(description: 'Not good', rating: 5, user_id: 3, ticket_id: 2)
Review.create(description: 'Very good', rating: 4, user_id: 2, ticket_id: 2)
Review.create(description: 'Totally good', rating: 5, user_id: 5, ticket_id: 5)
Review.create(description: 'Really good', rating: 3, user_id: 7, ticket_id: 4)
Review.create(description: 'Terrible', rating: 1, user_id: 4, ticket_id: 3)


Event.create(title: 'Party2', description: 'A Pretty good party', address: '95 Haversham Place', event_type: 'Birthday Party', price: 24, date_time: '10-12-1992', available?: true, organiser_id: 1, venue_id: 1)
Event.create(title: 'Party1', description: 'A really good party', address: '80 Plaice Place', event_type: 'Death Party', price: 56, date_time: '10-12-2020', available?: true, organiser_id: 2, venue_id: 1)
Event.create(title: 'Party7', description: 'A sub-par good party', address: '72 Cod Place', event_type: 'Divorce Party', price: 12, date_time: '02-05-2021', available?: false, organiser_id: 3, venue_id: 2)
Event.create(title: 'Partyyyy', description: 'A apalling good party', address: '21 Mino Place', event_type: 'Brexit Party', price: 5, date_time: '06-12-2022', available?: true, organiser_id: 4, venue_id: 4)
Event.create(title: 'Paaaaaarty', description: 'A good party', address: '1 Buckingham Place', event_type: 'Graduation Party', price: 46, date_time: '23-01-1997', available?: true, organiser_id: 5, venue_id: 5)

City.create(name: 'London')
City.create(name: 'Tokyo')


Venue.create(name: 'The Leaky Scrotum' , venue_type: 'Pub', city_id: 1)
Venue.create(name: 'The  Duck' , venue_type: 'Bar', city_id: 1)
Venue.create(name: 'The Leaky Kettle' , venue_type: 'Club', city_id: 2)
Venue.create(name: 'Ja  Pan' , venue_type: 'Casino', city_id: 2)
Venue.create(name: 'Tokyo  Bucket' , venue_type: 'Stadium', city_id: 2)


