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



a=User.create(email: 'evan@user.com', password: 'password', username: 'evan')
b=User.create(email: 'bob@user.com', password: 'password', username: 'bob')
c=User.create(email: 'matt@user.com', password: 'password', username: 'matt')
d=User.create(email: 'stephen@user.com', password: 'password', username: 'stephen')
e=User.create(email: 'mollie@user.com', password: 'password', username: 'mollie')
f=User.create(email: 'taco@user.com', password: 'password', username: 'taco')


active_game = Game.create(name: "GA Tech", finished: false)

p1=Player.create(game_id: active_game.id, user_id: a.id)
p2=Player.create(game_id: active_game.id, user_id: b.id)
p3=Player.create(game_id: active_game.id, user_id: c.id)

Flag.create(player_id: p1.id)
Flag.create(player_id: p2.id)
Flag.create(player_id: p3.id)


inactive_game = Game.create(name: "Inactive", finished: true)
inactive_game.users << [a,b,c,d,e]


Invitation.create(inviter_id: a.id, invited_id: d.id, game_id: active_game.id)