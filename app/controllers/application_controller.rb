class ApplicationController < ActionController::Base
  protect_from_forgery
  
  http_basic_authenticate_with name: ENV["username"], password: ENV["password"] if Rails.env.production?
  
end
