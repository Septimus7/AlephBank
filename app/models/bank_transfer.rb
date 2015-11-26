class BankTransfer < ActiveRecord::Base
  belongs_to :user
  belongs_to :account
  enum type: [:credit, :debit]
end
