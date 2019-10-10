# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [
  ['alex@gmail.com', '123123'],
  ['mike@gmail.com', '123123'],
  ['paul@gmail.com', '123123'],
  ['igor@gmail.com', '123123']
]

roles =[
  [admin],
  [employee],
  [client],
  [manager]
]


users.each do |email, password|
  User.create(email: email, password: password)
end

roles.each do |role_name|
  Role.create(name: role_name)
end
