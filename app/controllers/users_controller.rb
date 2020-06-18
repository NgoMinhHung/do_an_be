class UsersController < ApplicationController
  include UserService
  def update
    user = UserService::Update.call(@current_user, user_params)
    render_one user
  end

  def show
    render_one @current_user, UserSerializer
  end

  def update_config
    user = UserService::UpdateConfig.call(@current_user, config_params)
    render_one user, UserSerializer
  end

  def index
    render_list User.all 
  end

  private

  def render_one(user, serializer_class = UserSerializer) 
    data = {
      user: serializer_class.new(user)
    }

    render_data data
  end

  def render_list users
    data = {
      users: users 
    }

    render_data data
  end

  def config_params
    params.require(%i[has_limited_outcome_per_week limited_outcome_per_week has_limited_outcome_per_month limited_outcome_per_month])
    params.permit(:has_limited_outcome_per_week, :limited_outcome_per_week, :has_limited_outcome_per_month, :limited_outcome_per_month)
  end

  def user_params
    params.require(%i[name phone address gender])
    params.permit(:name, :phone, :address, :gender, :image_url)
  end

end
