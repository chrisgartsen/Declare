class CreateContactMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :contact_messages do |t|
      t.string :email, null: false
      t.text :message, null: false
      t.timestamps
    end

    add_index :contact_messages, :email

  end
end
