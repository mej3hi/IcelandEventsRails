class SignUpController < ApplicationController
  def new
    @user = User.new
  end

  def create
    puts "params: " + params.inspect
    @user = User.new(user_params)
    if @user.save
      sign_in_session @user
      redirect_to event_index_url
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :username, :password,
                                 :password_confirmation)
  end

end
