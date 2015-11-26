class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :address
      t.string :account_number
      t.string :description
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :contacts, :users
  end
end
