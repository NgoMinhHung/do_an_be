module TransactionItemService::GetByCategory
  def self.call (date, type, category_id)
    TransactionItemService::Index.call(date, type).of_category(category_id)
  end
end