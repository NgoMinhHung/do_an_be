class AuthController < ApplicationController

  skip_before_action :authorize_request
  
  def sign_in
    token, expired_time, user = AuthService::SignIn.call(sign_in_params)
    data = {
      user: UserSerializer.new(user),  
      token: token,
      expired_time: expired_time
    }
    render_data data
  end

  def sign_up
    user = AuthService::SignUp.call(sign_up_params)
    data = {
      user: UserSerializer.new(user)
    }
    render_data data
  end

  def sign_up_params
    params.require(%i[email name password])
    params.permit(:email, :name, :password)
  end

  def sign_in_params
    params.require(%i[email password])
    params.permit(:email, :password)
  end

end
