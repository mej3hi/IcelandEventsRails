class SignInController < ApplicationController

  def new
    @sign_in_error = false
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in_session user
      redirect_to my_events_url
    else
      @sign_in_error = true
      render 'new'
    end
  end

  def destroy
    sign_out_session
    redirect_to event_index_url
  end
end
