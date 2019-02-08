# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "田中　太郎",
            username: "タロウ",
            profile: "こんにちは、テストです。",
             password:              "foobar",
             password_confirmation: "foobar")

99.times do |n|
  name  = Faker::Name.name
  username = Faker::Name.unique.name
  profile = Faker::Lorem.paragraphs
  password = "password"
  User.create!(name:  name,
              username: username,
              profile: profile,
               password:              password,
               password_confirmation: password)
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
