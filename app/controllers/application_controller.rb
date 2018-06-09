class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SignInHelper



  private

  def logged_in_user
    unless logged_in?
      redirect_to sign_in_url
    end
  end


end
