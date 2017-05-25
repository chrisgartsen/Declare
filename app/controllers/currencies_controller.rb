class CurrenciesController < ApplicationController

  before_action :check_admin_authorisation

  def index
    @currencies = Currency.all
  end

end
