class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  
  def authenticate
      redirect_to new_session_path unless user_signed_in?
  end
  
  def authenticate_admin
    unless current_user.admin
      flash[:alert] = '관리자 권한이 없습니다 '
      redirect_to '/' 
    end
  end
  
end
