class Category < ApplicationRecord
  has_and_belongs_to_many :transaction_items
  has_and_belongs_to_many :outcomes
  validates :name, presence: true
end
