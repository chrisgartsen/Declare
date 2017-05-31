class CreateCurrencies < ActiveRecord::Migration[5.0]
  def change
    create_table :currencies do |t|
      t.string :code, null: false
      t.string :name, null: false
      t.timestamps
    end

    add_index :currencies, :code, unique: true

  end
end
