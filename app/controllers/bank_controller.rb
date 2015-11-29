class BankController < ApplicationController
  def transaction
    gon.x = ['Damian jest fajny', 'A Tomek jeszcze fajniejszy', 'Za to Bartek...'] # dummy

    # Dummy'an
  end

  def history
    gon.history = BankTransfer.where({user: current_user})
  end

  def help
    gon.helpEntries = HelpEntry.all
  end
end
