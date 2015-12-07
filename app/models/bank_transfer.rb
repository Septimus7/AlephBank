class BankTransfer < ActiveRecord::Base
  belongs_to :user
  belongs_to :account
  enum type: [:credit, :debit]

  def present_for_history
    attributes.merge({is_credit: amount < 0})
  end
end
