ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def login_as(user)
    session[:user_id] = users(user).id
  end
  
  def logout
    session.delete :user_id
  end

  # метод setup() будет вызывать login_as(),
  # только если определена сессия
  # Тем самым авторизация не будет исполняться
  # в тестах, которые не задействуют контроллер.
  def setup
    login_as :one if defined? session
  end

end
