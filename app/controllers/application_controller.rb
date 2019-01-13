# frozen_string_literal: true

# Top level controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include CombatsHelper
end
