class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :gender, :phone, :image_url

  has_one :budget, serializer: BudgetSerializer
end
