class PasswordResetsController < ApplicationController
  before_action :get_user, only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      redirect_to root_url
    else
      @user = User.new
      @user.errors.add(:email, 'Invalid email')
      render 'new'
    end

  end

  def edit
  end

  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, "Can't be empty")
      render 'edit'
    elsif @user.update_attributes(user_params)
      @user.update_attribute(:reset_digest, nil)
      sign_in_session(@user)
      redirect_to my_events_url
    else
      render 'edit'
    end

  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def get_user
    @user = User.find_by(email: params[:email])
  end

  def valid_user
    unless @user && @user.authenticated?(params[:token])
      redirect_to root_url
    end
  end

  def check_expiration
    if @user.password_reset_expired?
      @user.errors.add(:Expired, 'Password reset has expired.')
      render 'new'
    end
  end


end
