# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.delete_all

# 50.times do
#   User.create!(
#     username: Faker::Superhero.name,
#     email: Faker::Internet.email,
#     password: "123"
#   )
# end


35.times do
    Question.create!(
      title: Faker::RockBand.name,
      body: Faker::BackToTheFuture.quote,
      user_id: 56
    )
  end