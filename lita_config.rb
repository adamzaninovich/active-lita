$:.unshift "#{File.dirname(__FILE__)}/lib"

require 'lita/handlers/active_random'
require 'lita/handlers/bad_programming_languages'

Lita.configure do |config|

  # Adapter

  if ENV["RACK_ENV"] == "production"
    config.robot.adapter = :slack
    config.adapters.slack.token = ENV["SLACK_LITA_TOKEN"]
    config.robot.admins = ENV["LITA_ADMINS"].to_s.split ','
    config.redis[:url] = ENV["REDISTOGO_URL"]
    config.http.port = ENV["PORT"] || 80
  else
    config.robot.adapter = :shell
    config.http.port = 3000
  end

  # Handlers

  config.handlers.yelpme.consumer_secret = ENV['YELP_CONSUMER_SECRET']
  config.handlers.yelpme.consumer_key = ENV['YELP_CONSUMER_KEY']
  config.handlers.yelpme.token = ENV['YELP_TOKEN']
  config.handlers.yelpme.token_secret = ENV['YELP_TOKEN_SECRET']
  config.handlers.yelpme.default_city = 'Dallas'

  # The severity of messages to log. Options are:
  # :debug, :info, :warn, :error, :fatal
  # Messages at the selected level and above will be logged.
  config.robot.log_level = :debug
end
