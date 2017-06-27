class CreatePaymentTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :payment_types do |t|
      t.string :name, null: false
      t.timestamps
    end

    add_index :payment_types, :name, unique: true

  end
end
