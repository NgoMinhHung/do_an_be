class CreateBudgets < ActiveRecord::Migration[6.0]
  def change
    create_table :budgets do |t|
      t.float :total, default: 0.0
      t.float :atm, default: 0.0
      t.float :cash, default: 0.0
      t.references :user
      t.timestamps
    end
  end
end
