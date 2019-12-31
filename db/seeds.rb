Ticket.create(user_id: 1, event_id: 1)
Ticket.create(user_id: 1, event_id: 2)
Ticket.create(user_id: 6, event_id: 1)
Ticket.create(user_id: 3, event_id: 2)
Ticket.create(user_id: 6, event_id: 4)
Ticket.create(user_id: 7, event_id: 5)


User.create(name: 'Barry', organiser?: false)
User.create(name: 'Jerry', organiser?: true)
User.create(name: 'Perry', organiser?: false)
User.create(name: 'Polly', organiser?: true)
User.create(name: 'Sally', organiser?: false)
User.create(name: 'Larry', organiser?: false)
User.create(name: 'Steve', organiser?: false)

Review.create(description: 'Quiet good', rating: 3, user_id: 1, ticket_id: 1)
Review.create(description: 'Not good', rating: 5, user_id: 3, ticket_id: 2)
Review.create(description: 'Very good', rating: 1, user_id: 6, ticket_id: 2)
Review.create(description: 'Totally good', rating: 2, user_id: 5, ticket_id: 5)
Review.create(description: 'Really good', rating: 3, user_id: 7, ticket_id: 4)
Review.create(description: 'Terrible', rating: 1, user_id: 1, ticket_id: 3)

Event.create(title: 'Party2', description: 'A Pretty good party', address: '95 Haversham Place', event_type: 'Birthday Party', price: 24, date: '10-12-1992', available?: true, organiser_id: 2, venue_id: 1)
Event.create(title: 'Party1', description: 'A really good party', address: '80 Plaice Place', event_type: 'Death Party', price: 56, date: '10-12-2020', available?: true, organiser_id: 2, venue_id: 1)
Event.create(title: 'Party7', description: 'A sub-par good party', address: '72 Cod Place', event_type: 'Divorce Party', price: 12, date: '02-05-2021', available?: false, organiser_id: 4, venue_id: 2)
Event.create(title: 'Partyyyy', description: 'A apalling good party', address: '21 Mino Place', event_type: 'Brexit Party', price: 5, date: '06-12-2022', available?: true, organiser_id: 4, venue_id: 4)
Event.create(title: 'Paaaaaarty', description: 'A good party', address: '1 Buckingham Place', event_type: 'Graduation Party', price: 46, date: '23-01-1997', available?: true, organiser_id: 4, venue_id: 5)

City.create(name: 'London')
City.create(name: 'Tokyo')

Venue.create(name: 'The Leaky Scrotum' , venue_type: 'Pub', city_id: 1)
Venue.create(name: 'The Leaky Duck' , venue_type: 'Bar', city_id: 1)
Venue.create(name: 'The Leaky Kettle' , venue_type: 'Club', city_id: 2)
Venue.create(name: 'The Leaky Pan' , venue_type: 'Casino', city_id: 2)
Venue.create(name: 'The Leaky Bucket' , venue_type: 'Stadium', city_id: 2)

