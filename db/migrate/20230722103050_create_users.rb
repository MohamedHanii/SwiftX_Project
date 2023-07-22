class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.integer :id
      t.string :username
      t.string :password
      t.references :role, null: false, foreign_key: true

      t.timestamps
    end
    add_index :users, :id, unique: true
  end
end
