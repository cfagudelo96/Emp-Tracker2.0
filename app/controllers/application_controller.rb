class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_admin! unless Rails.env.test?
end
