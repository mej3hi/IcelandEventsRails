class Api::V1::SignUpController < Api::V1::ApiController
  skip_before_action :authenticate_request

  def create
    puts "params: " + params.inspect
    user = User.new(user_params)
    if user.save
      render status: 200, json: 'Successfully sign up'.to_json
    else
      render status: 422, json: { errors: user.errors }
    end

  end

  private

  def user_params
    params.require(:sign_up).permit(:name, :email, :username, :password,
                                 :password_confirmation)
  end

end