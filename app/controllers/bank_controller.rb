class BankController < ApplicationController
  skip_before_action :verify_authenticity_token

  def transaction
    gon.accounts = Account.where({user: current_user})

    @accounts = gon.accounts
  end

  def save_bank_transfer
    account = Account.find(params[:source_account])

    bank_transfer = BankTransfer.new(
        {
            :user => current_user,
            :contractor_name => params[:contractor_name],
            :contractor_address => params[:contractor_address],
            :contractor_account_number => params[:contractor_account_number],
            :account => account,
            :title => params[:title],
            :amount => params[:amount]
        }
    )
    bank_transfer.save

    account.amount -= params[:amount].to_f
    account.save

    flash[:success] = "Wysłano przelew"

    redirect_to :action => "history"
  end

  def history
    gon.history = BankTransfer.where({user: current_user})
    gon.accounts = Account.where({user: current_user})
  end

  def help
    gon.helpEntries = HelpEntry.all
  end
end
