module CategoryService::FindOrCreate
  def self.call_for_one(name)
    Category.find_or_create_by!(name: name)
  end

  def self.call_for_list(category_names)
    category_names.map do |name|
      call_for_one(name)
    end
  end
end