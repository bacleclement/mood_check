# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Creating user and his profile..."

email = "user1@gmail.com"
user = User.create!(email: email , password: "123456")
Profile.create!(
  user_id: user.id,
  gender: "homme",
  age: 77,
  username: "mich",
  level: 33
  )

puts "Seeds completed! :)"
