class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :audit

  private
  def audit
   # if cookies[:user_name] != nil
   #   return true;
   # end
   # redirect_to "/home/index"
  end
  
end
