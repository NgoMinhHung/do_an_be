class TransactionItemSerializer < ActiveModel::Serializer
  attributes :id, :amount, :note, :time, :transaction_type, :source
  has_many :categories, serializer: CategorySerializer
end
