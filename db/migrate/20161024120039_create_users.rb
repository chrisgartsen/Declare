class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :name, null: false
      t.string :password_hash, null: false
      t.string :password_salt, null: false
      t.boolean :admin, default: false
      t.boolean :active, default: false

      t.timestamps null: false
    end

    add_index :users, :name, unique: true
    add_index :users, :email, unique: true

  end
end
