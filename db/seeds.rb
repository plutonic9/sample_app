# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)


User.create!(name:  "John Pendergrass",
             email: "johnpendergrass@gmail.com",
             password:              "MG100mfw",
             password_confirmation: "MG100mfw",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "Plutonic9",
             email: "plutonic9@gmail.com",
             password:              "MG100mfw",
             password_confirmation: "MG100mfw",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "Tristan Pendergrass",
             email: "tristanpendergrass@gmail.com",
             password:              "co11een",
             password_confirmation: "co11een",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)


5.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end

# Microposts
users = User.order(:created_at).take(6)
10.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..10]
followers = users[3..12]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
