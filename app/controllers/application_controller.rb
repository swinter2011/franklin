class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def welcome
    render text: "Meet Franklin. Franklin helps you become the person you want to be."
  end
end
