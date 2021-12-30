# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
Event.destroy_all
User.destroy_all



puts "Creating Users"
user1 = User.create!(
  email: "user1@user.com",
  password: "password",
  first_name: "First",
  last_name: "User",
  chef: true
)

user2 = User.create!(
  email: "user2@user.com",
  password: "password",
  first_name: "Second",
  last_name: "User",
  chef: true
)
puts "Finished!"

puts "Creating Events"


10.times do
Event.create!(
  name:Faker::Food.dish,
  location:Faker::Address.city,
  description:Faker::Food.description,
  cuisine_type:Faker::Food.ethnic_category,
  price: rand(1..10),
  places_available: rand(1..6),
  start_time: "2021-06-14 18:00:00",
  end_time: "2021-06-14 21:00:00",
  user: [user1, user2].sample
)
end

puts "Finished creating events"

good_reviews = [
  "Great Diner and fun atmosphere!",
  "I loved the dessert !",
  "Excelent receipe, everyone around the table was fun",
  "I has a great pleasure taking place to this event and meeting great people around lekker food",
  "Amazing time spent together ",
  "100% recomand!Will do it again for sure!",
  "Perfect diner Thanks to our chef od the day",
  "I really had fun and ate very well",
  "CThe food was great as well as the people present at this event",
  "Just super happy I went there !",
  "Thanks to the chef of the day who prepared great fresh food"
]

bad_reviews = [
  "A bit too short, I would have loved to stay longer",
  "Ingredients were not 100% fresh",
  "Too expensive",
  "Food not fresh",
  "The chef was a bit too serious, I wish we could talk more ",
]


puts "Creating reviews"


20.times do
  Review.create!(
    content: good_reviews.sample,
    rating: rand(1..5),
    event: Event.all.sample
  )
end

10.times do
  Review.create!(
    content: bad_reviews.sample,
    rating: rand(1..5),
    event: Event.all.sample
  )
end

puts "Finished creating reviews"