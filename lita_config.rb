$:.unshift "#{File.dirname(__FILE__)}/lib"

require 'lita/handlers/active_random'
require 'lita/handlers/bad_programming_languages'

Lita.configure do |config|
  # # The name your robot will use.
  # config.robot.name = "Lita"

  # The adapter you want to connect with. Make sure you've added the
  # appropriate gem to the Gemfile.
  if ENV["RACK_ENV"] == "production"
    config.robot.adapter = :slack
  else
    config.robot.adapter = :shell
  end

  # Slack configurations
  # config.robot.mention_name = "@lita"
  # config.robot.alias = "lita"

  # Adapters
  config.adapters.slack.token = ENV["SLACK_LITA_TOKEN"]

  # Handlers
  # config.handlers.slack_handler.webhook_token = ENV["SLACK_WEBHOOK_TOKEN"]
  # config.handlers.slack_handler.team_domain = ENV["SLACK_TEAM_DOMAIN"]
  # config.handlers.slack_handler.ignore_user_name = "slackbot"

  config.handlers.yelpme.consumer_secret = ENV['YELP_CONSUMER_SECRET']
  config.handlers.yelpme.consumer_key = ENV['YELP_CONSUMER_KEY']
  config.handlers.yelpme.token = ENV['YELP_TOKEN']
  config.handlers.yelpme.token_secret = ENV['YELP_TOKEN_SECRET']
  config.handlers.yelpme.default_city = 'Dallas'

  # The locale code for the language to use.
  # config.robot.locale = :en

  # The severity of messages to log. Options are:
  # :debug, :info, :warn, :error, :fatal
  # Messages at the selected level and above will be logged.
  config.robot.log_level = :info

  config.redis.url = ENV["REDISTOGO_URL"]
  config.http.port = ENV["PORT"]

  config.robot.admins = ENV["LITA_ADMINS"].to_s.split ','
end
