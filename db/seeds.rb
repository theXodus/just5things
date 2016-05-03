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
    name: Faker::Lorem.sentence
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
