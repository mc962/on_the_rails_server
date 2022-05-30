ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

unless ENV['RM_INFO']
  # Current implementation of IntelliJ Minitest support conflicts with Minitest::Reporters, and so this should be
  #   deactivated in a RubyMine environment.

  require "minitest/reporters"

  # Activate Minitest Reporters
  Minitest::Reporters.use!
end

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods

  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include Capybara::DSL
  include Capybara::Minitest::Assertions

  driven_by :selenium,
            using: :headless_chrome,
            screen_size: [1400, 1400]
end

class ApplicationControllerTestCase < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include Warden::Test::Helpers
  include Capybara::DSL
  include Capybara::Minitest::Assertions
end
