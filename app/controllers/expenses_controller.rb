class ExpensesController < ApplicationController

  before_action :check_authorisation

  def index
    @expenses = current_user.expenses
  end

end
