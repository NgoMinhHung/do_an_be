class AddSourceToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :transaction_items, :source, :string, default: 'cash'
  end
end
