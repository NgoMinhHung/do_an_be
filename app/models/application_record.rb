class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  cattr_accessor :current_user

  scope :mine, -> { where(user_id: current_user&.id) }
end
