class CreateTransactionTypesEnum < ActiveRecord::Migration[6.0]
  def change
    execute <<-DDL
      CREATE TYPE transaction_types as ENUM ('income', 'outcome')
    DDL
  end
end
