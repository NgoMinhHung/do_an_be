class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|

      t.bigint :user_id
      t.string :email
      t.string :password_digest
      t.boolean :is_activated, default: false
      t.datetime :activated_at
      t.string :activation_code
      t.string :activation_code_expired_at
      t.timestamps
    end

    add_index :accounts, :email, unique: true
  end
end
