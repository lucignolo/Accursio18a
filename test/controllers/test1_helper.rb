ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest

  # Log in as a particular user (mantenuto come promemoria: log_bidone).
  def log_bidone(user)
    #    post login_path, params: { session: { email: user.email,
    #                                         password: password,
    #                                          remember_me: remember_me } }
    return true
  end  #def
end   #class
