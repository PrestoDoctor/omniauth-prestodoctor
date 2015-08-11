# OmniAuth PrestoDoctor Strategy

OmniAuth 2 strategy for [PrestoDoctor](https://prestodoctor.com/)

For more details, read the [PrestoDoctor API Reference](https://prestodoctor.com/docs)

# Installation

Add to your Gemfile:

```ruby
gem 'omniauth-prestodoctor'
```

then bundle install

# Usage & Configuration

Here's an example, adding the middleware to a Rails app in config/initializers/omniauth.rb:

You can configure permissions/scope (as a space separated string),
which you pass in to the `provider` method after your `PRESTO_APP_ID` and `PRESTO_SECRET`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :presto_doctor, ENV['PRESTO_APP_ID'], ENV['PRESTO_SECRET'], scope: 'user_info recommendation photo_id'
end
```

Available scopes are:

- `user_info`
- `recommendation`
- `photo_id`

If you don't include any `scope` it will default to only `user_info`.

NOTE: While developing your application, if you change the scope in the initializer you will need to restart your app server.

You can now access the OmniAuth PrestoDoctor OAuth2 URL: /auth/prestodoctor

# Usage with Devise

In your app/initializers/devise.rb, in the omniauth section, add a line using similar syntax and configuration:

```ruby
config.omniauth :presto_doctor, ENV['PRESTO_APP_ID'], ENV['PRESTO_SECRET'], scope: 'user_info recommendation photo_id'
```

## Add to your User model

For a user to be able to log in via PrestoDoctor, you will need to set on your User model:

```ruby
devise :omniauthable, :omniauth_providers => [:prestodoctor]
```

## Including in Views

You will now be able to link to the PrestoDoctor authorization path, like so:

```erb
<%= link_to user_omniauth_authorize_path(:prestodoctor) do %>
  <%= image_tag 'prestodoctor-login.png' %>
<% end %>
```

# Callbacks

You will need to set up a callback path that we can call with the generated token

You can see an example of this here: https://github.com/PrestoDoctor/prestodoctor-oauth

(look at `app/controllers/users/omniauth/callbacks_controller.rb` and it's related entry in `routes.rb`)
