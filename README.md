<<<<<<< HEAD
Tiy Hackathon
================

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

This application was generated with the [rails_apps_composer](https://github.com/RailsApps/rails_apps_composer) gem
provided by the [RailsApps Project](http://railsapps.github.io/).

Rails Composer is open source and supported by subscribers. Please join RailsApps to support development of Rails Composer.

Problems? Issues?
-----------

Need help? Ask on Stack Overflow with the tag 'railsapps.'

Your application contains diagnostics in the README file. Please provide a copy of the README file when reporting any issues.

If the application doesn't work as expected, please [report an issue](https://github.com/RailsApps/rails_apps_composer/issues)
and include the diagnostics.

Ruby on Rails
-------------

This application requires:

- Ruby 2.1.5
- Rails 4.2.0

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).

ROUTING
-------

  USER ROUTING
  -------
To create a new user
-------


  POST /users

      JSON requested: {user: {username: string, email: string, password: string}}`

    if the user is successfully created NOTE: THE USER IS NOT SIGNED IN AFTER REGISTRATION
  
      JSON returned: {user: {email: string, id: string, authentication_token: string}}, status: :created (status 201)

    else

      status: {user: {user.errors}}, status: :ok

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

      JSON returned: {user: nil}, status: :unprocessable_entity (status 422)


To sign in a user
-------

  POST /users/sign_in

      JSON requested: {user: {email: string, password: string}}

    return if successful

      JSON returned: {user: {email: string, id: string, total_points: integer, game_id: nil OR integer}}, status: :ok (status 200)

    else

      JSON returned: {user: nil}, status: unprocessable_entity (status 422)



  GAME ROUTING
  -------


To create a game
-------

  POST /games/new

      JSON requested: {game: {center_lat: up to 6 decimal places, center_long: up to 6 decimal places, radius: up to 3 decimal places, starts_at: string (this will be a time... example: 5:00pm), duration: integer}}

    if successful:

      JSON returned: {game: {center_lat: up to 6 decimal places, center_long: up to 6 decimal places, radius: up to 3 decimal places, starts_at: timestamp, game_duration: integer}}, status: :created (status 201)

    else

      JSON returned: {error: {list of errors thrown}}, status: :unprocessable_entity (status 422)


  GET /games/:id/admin

      JSON requested: only authentication_token

    if authenticated

      JSON returned: {game: {
                          center_lat: up to 6 decimal places, 
                          center_long: up to 6 decimal places, 
                          radius: up to 3 decimal places, 
                          starts_at: timestamp, 
                          ends_at: timestamp}, 
                      players: {
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
                            }
                        } status: :ok (status 200)

    else

      JSON returned: {error => "Authentication Failure! BOO!"}, status: :unauthenticated (status 500)


To send Invitations to Users
-------

  POST /invitations/new

      JSON requested: {inviter_id (will be current user's ID): integer, invited_id: integer, game_id: integer}

    if successful

      JSON returned: {invitation: {inviter_id: integer, invited_id: integer, game_id: integer}}, status: :created (status 201)

    else

      JSON returned: {error: {all errors thrown}}, status: :unprocessable_entity (status 422)











