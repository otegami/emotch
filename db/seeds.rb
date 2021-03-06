# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create sample user data
99.times do |n|
  name = Faker::Name.name
  uid = n
  User.create!(
    name: name,
    uid: uid,
  )
end

# create sample tweet data
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(1)
  users.each{ |user| user.tweets.create!(content: content) }
end

# create sample emotions
tweets = Tweet.where(user_id: 2)
user = User.first
tweets.each { |tweet| user.emo(tweet) }
