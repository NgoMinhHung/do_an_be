module CategoryService::Index
  def self.call user
    categories = []
    user.transaction_items.each do |transaction_item|
        categories += transaction_item.categories
    end
    categories.uniq  {|category| category.id}
  end
end