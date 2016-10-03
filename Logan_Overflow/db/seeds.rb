# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


20.times do
  user = User.create!( username: Faker::Internet.user_name,
                       email: Faker::Internet.safe_email,
                       password: '123'
                      )
end

40.times do
 post = Post.create!( title: Faker::Company.catch_phrase,
                      content: Faker::Lorem.paragraph,
                      user_id: rand(1..20)
                     )
end

100.times do
  answer = Answer.create!( user_id: rand(1..20),
                           post_id: rand(1..40),
                           content: Faker::Hipster.sentence
                          )
end
