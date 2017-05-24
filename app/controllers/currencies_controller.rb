class CurrenciesController < ApplicationController

  before_action :check_authorisation

  include AuthenticationHelper

  def index
    @currencies = Currency.all
  end

  private

    def check_authorisation
      redirect_to login_path unless is_admin?
    end

end
