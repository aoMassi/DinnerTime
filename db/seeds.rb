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
  places_available: rand(0..5),
  start_time: "2021-06-14 18:00:00",
  end_time: "2021-06-14 21:00:00",
  user: [user1, user2].sample
)
end

puts "Finished creating events"