# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Game.delete_all
Invitation.delete_all
Flag.delete_all
Player.delete_all



puts 'creating users'
a=User.create(email:  'evan@user.com', password: 'password', username: 'evan', authentication_token: '123' )
b=User.create(email: 'bob@user.com', password: 'password', username: 'bob')
c=User.create(email: 'matt@user.com', password: 'password', username: 'matt')
d=User.create(email: 'stephen@user.com', password: 'password', username: 'stephen')
e=User.create(email: 'mollie@user.com', password: 'password', username: 'mollie')
f=User.create(email: 'taco@user.com', password: 'password', username: 'taco')


puts 'creating games'
active_game=Game.create(name: "MLK Library", center_lat: 0, center_long: 0, radius: 0.5, 
			  duration: 4, starts_at: '5:00pm', ends_at: '6:00pm')

inactive_game=Game.create(name: "GA Tech", center_lat: 0, center_long: 0, radius: 0.5, 
			  duration: 4, starts_at: '5:00pm', ends_at: '6:00pm', finished: true)


puts 'creating players'
p1=Player.create(game_id: active_game.id, user_id: a.id)
p2=Player.create(game_id: active_game.id, user_id: b.id)
p3=Player.create(game_id: active_game.id, user_id: c.id)

puts 'creating flags'
Flag.create(player_id: p1.id, flag_lat: 0, flag_long: 0)
Flag.create(player_id: p2.id, flag_lat: 0, flag_long: 0)
Flag.create(player_id: p3.id, flag_lat: 0, flag_long: 0)


inactive_game = Game.create(name: "Inactive", finished: true)
inactive_game.users << [a,b,c,d,e]


Invitation.create(inviter_id: a.id, invited_id: d.id, game_id: active_game.id)
