require "instagram"

Instagram.configure do |config|
  config.client_id = ENV["client_id"]
  config.client_secret = ENV["client_secret"]
  config.access_token = ENV["access_token"]
end
