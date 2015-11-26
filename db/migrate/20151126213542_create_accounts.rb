class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :number
      t.references :user, index: true
      t.float :amount

      t.timestamps null: false
    end
    add_foreign_key :accounts, :users
  end
end
