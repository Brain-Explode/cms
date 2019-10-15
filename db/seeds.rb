# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [
  ['admin@gmail.com', '123123'],
  ['user1@gmail.com', '123123'],
  ['user2@gmail.com', '123123'],
  ['user3@gmail.com', '123123']
]

roles =[
  'admin',
  'employee',
  'client',
  'manager'
]

users.each do |email, password|
  User.create(email: email, password: password)
end

roles.each do |role_name|
  Role.create(name: role_name)
end

#default admin - user with id = 1
User.find(1) do |f|
f.add_role :admin
end
