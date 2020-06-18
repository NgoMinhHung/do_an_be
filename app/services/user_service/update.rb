module UserService::Update 
  def self.call(user, user_params )
    user.update!(user_params)
    user
  end
end