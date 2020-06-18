class CreateCategoryTransactionItem < ActiveRecord::Migration[6.0]
  def change
    create_table :categories_transaction_items do |t|
      t.references :transaction_item, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
    end
  end
end
