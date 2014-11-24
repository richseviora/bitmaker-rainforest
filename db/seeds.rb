# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

10.times do
  Product.create(name: Faker::Commerce.product_name, description:Faker::Company.catch_phrase, price_in_cents: Faker::Number.between(1,10000))
end

10.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password: '123456' )
end

100.times do
  random_user = User.offset(rand(User.count)).first
  random_product = Product.offset(rand(Product.count)).first
  Review.create(user: random_user, product: random_product, comment: Faker::Hacker.say_something_smart)
end