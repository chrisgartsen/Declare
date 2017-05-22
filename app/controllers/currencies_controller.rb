class CurrenciesController < ApplicationController

  include AuthenticationHelper

  def index
    redirect_to login_path unless logged_in?
    @currencies = Currency.all
  end

end
