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
    require 'pry'
    require 'dotenv'
    Dotenv.load
    config.robot.adapter = :shell
    config.http.port = 3000
    config.adapters.slack.token = 'invalid'
  end

  # Handlers
  config.handlers.google_images.safe_search = :active
  config.handlers.memegen.username = ENV["MEMEGEN_USER"]
  config.handlers.memegen.password = ENV["MEMEGEN_PASS"]
  config.handlers.memegen.command_only = false

  # The severity of messages to log. Options are:
  # :debug, :info, :warn, :error, :fatal
  config.robot.log_level = :warn
end
