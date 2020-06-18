class CreateTransactionItems < ActiveRecord::Migration[6.0]
  def change
    create_table :transaction_items do |t|
      t.references :user, null: false, foreign_key: true
      t.float :amount, null: false
      t.datetime :time, null: false
      t.text :note, null: false
      t.column :transaction_type, :transaction_types, default: 'outcome', null: false
      t.timestamps
    end
  end
end
