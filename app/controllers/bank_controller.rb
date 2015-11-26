class BankController < ApplicationController
  def transaction
    gon.x = [123, 'Damian jest fajny'] # dummy
  end

  def history
  end

  def help
  end
end
