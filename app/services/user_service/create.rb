module UserService::Create
  def self.call(sign_up_params)
    user = User.create!(sign_up_params.except(:email, :password))
    user.create_account!(sign_up_params.except(:name))
    user
  end
end