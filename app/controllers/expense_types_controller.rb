class ExpenseTypesController < ApplicationController

  before_action :check_admin_authorisation

  def index
    @expense_types = ExpenseType.all
  end

end
