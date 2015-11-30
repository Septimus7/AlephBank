class BankController < ApplicationController
  def transaction
    gon.accounts = Account.where({user: current_user})
  end

  def history
    gon.history = BankTransfer.where({user: current_user})
    gon.accounts = Account.where({user: current_user})
  end

  def help
    gon.helpEntries = HelpEntry.all
  end
end
