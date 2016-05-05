hobbes = User.create!(
  email: 'hobbes@example.com',
  password: 'bentley',
  confirmed_at: Time.zone.now
)

15.times do
  User.create!(
    email: Faker::Internet.email,
    password: 'hobbes',
    confirmed_at: Time.zone.now
    )
end
users = User.all

60.times do
  Item.create!(
    user: users.sample,
    name: Faker::StarWars.quote,
    created_at: Faker::Time.backward(14)
  )
end

10.times do
  Item.create!(
  user: hobbes,
  name: Faker::StarWars.quote,
  created_at: Faker::Time.backward(7)
  )
end



puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
