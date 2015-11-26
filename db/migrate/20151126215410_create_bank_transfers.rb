class CreateBankTransfers < ActiveRecord::Migration
  def change
    create_table :bank_transfers do |t|
      t.references :user, index: true
      t.string :contractor_name
      t.string :contractor_address
      t.string :contractor_account_number
      t.references :account, index: true
      t.string :title
      t.float :amount
      t.integer :type

      t.timestamps null: false
    end
    add_foreign_key :bank_transfers, :users
    add_foreign_key :bank_transfers, :accounts
  end
end
