
class Api::V1::PasswordResetsController < Api::V1::ApiController

  skip_before_action :authenticate_request

  before_action :get_user, only: :update
  before_action :valid_user, only: :update
  before_action :check_expiration, only: :update

  def create
    user = User.find_by(email: params[:password_reset][:email].downcase)
    if user
      user.create_reset_digest
      user.send_password_reset_email
      render status: 200, json: 'Successfully request reset password'.to_json
    else
      user = User.new
      user.errors.add(:email, 'invalid email')
      render status: 422, json: { errors: user.errors }
    end

  end

  def update
    if params[:password_reset][:password].empty?
      @user.errors.add(:password, "Can't be empty")
      render status: 422, json: { errors: @user.errors }
    elsif @user.update_attributes(user_params)
      @user.update_attribute(:reset_digest, nil)
      render status: 200, json: 'Successfully reset password'.to_json
    else
      render status: 422, json: { errors: @user.errors }
    end

  end

  private

  def user_params
    params.require(:password_reset).permit(:password, :password_confirmation)
  end

  def get_user
    @user = User.find_by(email: params[:email])
  end

  def valid_user
    unless @user && @user.authenticated?(params[:token])
      @user.errors.add(:token, 'invalid token')
      render status: 422, json: { errors: @user.errors }
    end
  end

  def check_expiration
    if @user.password_reset_expired?
      @user.errors.add(:token, 'token expired')
      render status: 422, json: { errors: @user.errors }
    end
  end


end