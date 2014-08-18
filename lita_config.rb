$:.unshift "#{File.dirname(__FILE__)}/lib"

require 'lita/handlers/active_random'

Lita.configure do |config|
  # The name your robot will use.
  config.robot.name = "Lita"

  # The adapter you want to connect with. Make sure you've added the
  # appropriate gem to the Gemfile.
  if ENV["RACK_ENV"] == "production"
    config.robot.adapter = :slack
  else
    config.robot.adapter = :shell
  end

  # Slack configurations
  config.robot.mention_name = "@lita"
  config.robot.alias = "lita"

  # Adapters
  config.adapter.username = "lita"
  config.adapter.incoming_token = ENV["SLACK_INCOMING_TOKEN"]
  config.adapter.team_domain = ENV["SLACK_TEAM_DOMAIN"]
  config.adapter.incoming_url = ENV["SLACK_INCOMING_URL"]
  #config.adapter.add_mention = true

  # Handlers
  config.handlers.slack_handler.webhook_token = ENV["SLACK_WEBHOOK_TOKEN"]
  config.handlers.slack_handler.team_domain = ENV["SLACK_TEAM_DOMAIN"]
  config.handlers.slack_handler.ignore_user_name = "slackbot"

  # The locale code for the language to use.
  # config.robot.locale = :en

  # The severity of messages to log. Options are:
  # :debug, :info, :warn, :error, :fatal
  # Messages at the selected level and above will be logged.
  config.robot.log_level = :info

  config.redis.url = ENV["REDISTOGO_URL"]
  config.http.port = ENV["PORT"]
end
