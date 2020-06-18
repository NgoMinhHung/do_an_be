class TransactionItemsController < ApplicationController

  def create
    transaction_item = TransactionItemService::Create.call(@current_user, transaction_item_params)
    render_one transaction_item
  end

  def index
    transaction_items = TransactionItemService::Index.call(params[:date], params[:type])
    render_list transaction_items
  end

  def get_by_category
    render_list TransactionItemService::GetByCategory.call(params[:date], params[:type],params[:category_id])
  end

  def render_one transaction_item
    data = {
      user: UserSerializer.new(@current_user),
      transaction_item: TransactionItemSerializer.new(transaction_item)
    }

    render_data data
  end

  def render_list transaction_items
    data = {
      user: UserSerializer.new(@current_user),
      transaction_items: transaction_items.map { |transaction_item| TransactionItemSerializer.new(transaction_item) } 
    }

    render_data data
  end

  def transaction_item_params
    params.require(%i[amount time note transaction_type source])
    params.permit(:amount, :time, :note, :transaction_type, :source, categories: [])
  end

end
