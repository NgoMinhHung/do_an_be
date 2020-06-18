module UserService::UpdateConfig
  def self.call(user, config_params)
    user.budget.update_attributes!(config_params)
    user
  end
end