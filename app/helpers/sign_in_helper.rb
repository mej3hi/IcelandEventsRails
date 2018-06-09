module SignInHelper
  # Logs in the given user
  def sign_in_session(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def sign_out_session
    session.delete(:user_id)
    @current_user
  end


end
