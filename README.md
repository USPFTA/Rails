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

      JSON requested: {user: {id: integer}}

    return:

      JSON returned: {users: {user: {email: string, id: integer, total_points: integer}... for each user}}, status: :ok (status 200)


To view an individual user's information
-------

  GET /users/:id

      JSON requested: {user: {id: integer}}

    return if ID sent in JSON matches ID in route

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







