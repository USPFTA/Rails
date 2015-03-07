# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
User.create(email: 'evan@user.com', password: 'password', username: 'evan')
User.create(email: 'bob@user.com', password: 'password', username: 'bob')
User.create(email: 'matt@user.com', password: 'password', username: 'matt')
User.create(email: 'stephen@user.com', password: 'password', username: 'stephen')
User.create(email: 'mollie@user.com', password: 'password', username: 'mollie')
User.create(email: 'taco@user.com', password: 'password', username: 'taco')
