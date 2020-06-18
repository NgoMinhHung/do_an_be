class CategoriesController < ApplicationController
  def index
    categories = CategoryService::Index.call @current_user
    render_list categories
  end

  def render_list categories
    data = {
        categories: categories.map do |category| 
            CategorySerializer.new(category)
        end
    }

    render_data data
  end
end
