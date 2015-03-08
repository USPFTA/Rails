TIY Hackathon
=========

Ruby on Rails
-------------

This application requires:

- Ruby 2.1.5
- Rails 4.2.0

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).

ROUTING
-------

USER ROUTING
========



To create a new user
-------


  POST /users

      JSON requested: {user: {username: string, email: string, password: string}}`

    if the user is successfully created NOTE: THE USER IS NOT SIGNED IN AFTER REGISTRATION
  
      JSON returned: {user: {email: string, id: string, authentication-token: string}}, status: :created (status 201)

    else

      status: {error: {errors thrown}}, status: :ok

To view a list of all users
-------

  GET /users

    if authenticated

      JSON returned: {users: {user: {email: string, id: integer, total_points: integer}... for each user}}, status: :ok (status 200)


To view an individual user's information
-------

  GET /users/:id

      JSON returned: {user: {username: string, email: string, id: integer, game_id: nil OR integer}}, status: :ok (status 200)

    else

      JSON returned: {error: {errors thrown}}, status: :unprocessable_entity (status 422)


To sign in a user
-------

  POST /users/sign_in

      JSON requested: {user: {email: string, password: string}}

    return if successful

      JSON returned: {user: {email: string, id: string, total_points: integer, game_id: nil OR integer}}, status: :ok (status 200)

    else

      JSON returned: {error: {errors thrown}}, status: unprocessable_entity (status 422)



GAME ROUTING
========


To create a game
-------

  POST /games/new

      JSON requested: {game: {center_lat: up to 6 decimal places, center_long: up to 6 decimal places, radius: up to 3 decimal places, starts_at: string (this will be a time... example: 5:00pm), duration: integer}}

    if successful:

      JSON returned: {game: {center_lat: up to 6 decimal places, center_long: up to 6 decimal places, radius: up to 3 decimal places, starts_at: timestamp, game_duration: integer}}, status: :created (status 201)

    else

      JSON returned: {error: {list of errors thrown}}, status: :unprocessable_entity (status 422)

To view an individual game (from PC)
-------

  GET /games/:id/admin

      JSON requested: only authentication_token

    if authenticated

      JSON returned: {game: {
                          center_lat: up to 6 decimal places, 
                          center_long: up to 6 decimal places, 
                          radius: up to 3 decimal places, 
                          starts_at: timestamp, 
                          ends_at: timestamp}, 
                      users: {
                              user: {
                                  id: integer, 
                                  email: string, 
                                  username: string}
                              user: {
                                  id: integer, 
                                  email: string, 
                                  username: string}
                                  }
                                }
                            },
                      players: {
                              player: {
                                  id: integer
                                  score: integer
                                  user_id: integer
                                  game_id: integer},
                              player: {
                                  id: integer
                                  score: integer
                                  user_id: integer
                                  game_id: integer}
                                },
                      flags: {
                              flag: {
                                  flag_id: integer,
                                  player_id: integer,
                                  flag_lat: decimal,
                                  flag_long: decimal},
                              flag: {
                                  flag_id: integer,
                                  player_id: integer,
                                  flag_lat: decimal,
                                  flag_long: decimal}
                              }
                        } status: :ok (status 200)

    else

      JSON returned: {error: {errors thrown}}, status: :unprocessable_entity (status 422)

To View an Individual Game (from iOS)
-------

  GET /games/:id

      JSON requested: only authentication_token

    if authenticated

      JSON returned: {game: {
                          center_lat: up to 6 decimal places, 
                          center_long: up to 6 decimal places, 
                          radius: up to 3 decimal places, 
                          starts_at: timestamp, 
                          ends_at: timestamp}, 
                      users: {
                              user: {
                                  id: integer, 
                                  email: string, 
                                  username: string}
                              user: {
                                  id: integer, 
                                  email: string, 
                                  username: string}
                                  }
                                }
                            },
                      players: {
                              player: {
                                  id: integer
                                  score: integer
                                  user_id: integer
                                  game_id: integer},
                              player: {
                                  id: integer
                                  score: integer
                                  user_id: integer
                                  game_id: integer}
                                },
                      flags: {
                              flag: {
                                  flag_id: integer,
                                  player_id: integer,
                                  flag_lat: decimal,
                                  flag_long: decimal},
                              flag: {
                                  flag_id: integer,
                                  player_id: integer,
                                  flag_lat: decimal,
                                  flag_long: decimal}
                              }
                        } status: :ok (status 200)

    else

      JSON returned: {error: {errors thrown}}, status: :unprocessable_entity (status 422)
      
      

INVITATION ROUTING
========


To send Invitations to Users
-------

  POST /invitations

      JSON requested: {inviter_id (will be current user's ID): integer, invited_id: integer, game_id: integer}

    if successful

      JSON returned: {invitation: {inviter_id: integer, invited_id: integer, game_id: integer}}, status: :created (status 201)

    else

      JSON returned: {error: {all errors thrown}}, status: :unprocessable_entity (status 422)


iOS - To View All of User's Invitations
-------

  GET /invitations/users/:id

    if the user has any invitations

      JSON returned: {invitations: {
                                  invitation: { inviter_id: integer
                                              invited_id: integer (this is the current user)
                                              game_id: integer}
                                  invitation: { inviter_id: integer
                                              invited_id: integer (this is the current user)
                                              game_id: integer}
                                  }
                            }, status: :ok (status 200)

    else

      JSON returned: {invitations: nil}, status: :ok (status 200)


iOS - To Accept an Invitation
-------
  
  POST /invitations/:id/accept

      JSON requested: {invitation: {inviter_id: integer, invited_id: integer, game_id: integer}}

    if the game is joined successfully

      JSON returned: {game: { center_lat: decimal,
                              center_long: decimal,
                              radius: decimal,
                              starts_at: timestamp,
                              ends_at: timestamp}
                      players: { user: {
                                  id: integer, 
                                  email: string, 
                                  username: string},
                                 user: {
                                  id: integer, 
                                  email: string, 
                                  username: string}
                            }
                        }, status: :ok (status 200)                             

    else

      JSON returned: {error: {errors thrown}}, status: :unprocessable_entity (status 422)


iOS - To Decline an Invitation
-------

  POST /invitations/:id/decline

      JSON requested: {invitation: {inviter_id: integer, invited_id: integer, game_id: integer}}

    if the invitation was successfully declined/destroyed

      JSON returned: {invitation: nil}, status: :ok (status 200)

    else

      JSON returned: {error: {errors thrown}}, status: :unprocessable_entity (status 422)



FLAG ROUTING
=========


iOS - To Place a Flag
-------

  POST /flags

      JSON requested: {flag: {name: string, flag_lat: decimal, flag_long: decimal}}

    if created

      JSON returned: {flag: {name: string, flag_lat: decimal, flag_long: decimal, player_id: integer}}, status: :created (status 201)

    else

      JSON returned: {error: {errors thrown}}, status: :unprocessable_entity (status 422)


iOS - To Delete a Flag (before game starts)
-------

  DELETE /flags/:id

    if successful

      JSON returned: {flag: nil}, status: :ok (status 200)

    else

      JSON returned: {error: {errors thrown}}, status: :unprocessable_entity (status 422)



TAG ROUTING
=========

  
iOS - To Tag a Flag
-------

  POST /tags

    A user cannot tag their own flag! This will throw a Forbidden 403 error!

      JSON requested: {tag: {flag_id: integer}}

    if successful

      JSON returned: {tag: {id: integer, flag_id: integer, player_id: integer}}, status: :created (status 201)

    else

      JSON returned: {error: {errors thrown}}, status: :unprocessable_entity (status 422)

      














