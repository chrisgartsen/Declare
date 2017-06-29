class PaymentTypesController < ApplicationController

  before_action :check_admin_authorisation

  def index
    @payment_types = PaymentType.all
  end
end
