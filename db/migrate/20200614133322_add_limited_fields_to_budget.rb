class AddLimitedFieldsToBudget < ActiveRecord::Migration[6.0]
  def change
    add_column :budgets, :has_limited_outcome_per_week, :boolean, default: false
    add_column :budgets, :limited_outcome_per_week, :float, default: 0.0
    add_column :budgets, :has_limited_outcome_per_month, :boolean, default: false
    add_column :budgets, :limited_outcome_per_month, :float, default: 0.0
  end
end
