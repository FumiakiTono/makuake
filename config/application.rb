require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

ActiveRecord::Base.protected_environments = %w(staging)


module Makuake
  class Application < Rails::Application
    config.generators do |g|
      g.helper false
      g.coffee false
      g.test false
    end

    config.i18n.default_locale = :ja
  end
end
