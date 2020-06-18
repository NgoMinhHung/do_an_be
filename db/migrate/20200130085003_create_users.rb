class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|

      t.string :name, null: false
      t.string :phone
      t.boolean :gender, default: false
      t.string :address
      t.timestamps
    end
  end
end
