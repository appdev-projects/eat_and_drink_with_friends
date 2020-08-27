# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

20.times do 
    user = User.new 
    user.first_name = Faker::Name.first_name 
    user.email = "#{user.first_name}@example.com" 
    user.last_name = Faker::Name.last_name 
    user.phone_number = Faker::PhoneNumber.phone_number
    user.password = "password"
    user.save
end

p "You created #{User.count} users"
p User.first.email
users = User.all 

Party.destroy_all
10.times do 
    party = Party.new 
    party.date = Faker::Date.between(from: '2020-09-20', to: '20202-09-25')
    party.time = Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
    party.description = Faker::GreekPhilosophers.quote
    party.address = Faker::Address.full_address
    party.user_id = users.sample.id
    party.save 
end

p "You created #{Party.count} parties"
parties = Party.all 

Drink.destroy_all 
50.times do 
    drink = Drink.new
    drink.name = Faker::Beer.name
    drink.party_id = parties.sample.id
    drink.user_id = users.sample.id 
    drink.save 
end
p "You created #{Drink.count} drinks"

Gathering.destroy_all
30.times do 
    gathering = Gathering.new
    gathering.user_id = users.sample.id
    gathering.party_id = parties.sample.id
    gathering.rsvp = Faker::Boolean.boolean
    gathering.save
end

p "You created #{Gathering.count} Gatherings"

Food.destroy_all 
50.times do 
    food = Food.new 
    food.name = Faker::Food.dish
    food.description = Faker::Food.description 
    food.party_id = parties.sample.id
    food.user_id = users.sample.id
    food.save 
end

p "You created #{Food.count} Foods"





# 10.times do 
#     drink = Drink.new
#     drink.name
#     d

# p Drink.count 