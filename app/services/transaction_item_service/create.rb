module TransactionItemService::Create
  def self.call(user, transaction_item_params)
    transaction_item = user.transaction_items.create!(transaction_item_params.except(:categories))   
    user.update_budget transaction_item
    categories = transaction_item_params[:categories]
    transaction_item.categories << CategoryService::FindOrCreate.call_for_list(categories)
    transaction_item
  end
end   