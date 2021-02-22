require_relative 'boot'

require 'rails/all'
require 'sqlite3'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ShortLink
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.after_initialize do
      $db = if File.exist?('test.db')
              SQLite3::Database.open('test.db')
            else
              puts 'Creating database...'
              SQLite3::Database.new('test.db')
            end

      $db.execute('CREATE TABLE IF NOT EXISTS data(code TEXT, url TEXT)')
      $db.results_as_hash = true
    end
  end
end
