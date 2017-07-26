class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.references :project,      foreign_key: true, null: false
      t.references :payment_type, foreign_key: true
      t.references :expense_type, foreign_key: true
      t.references :currency,     foreign_key: true
      t.date :expense_date
      t.decimal :amount, precision: 8, scale: 2
      t.timestamps
    end
  end
end
