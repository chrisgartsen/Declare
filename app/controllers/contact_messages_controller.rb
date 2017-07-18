class ContactMessagesController < ApplicationController

  before_action :check_admin_authorisation, only: [:index]

  def new
    @contact_message = ContactMessage.new
  end

  def create
    @contact_message = ContactMessage.new(contact_message_params)
    if verify_recaptcha(model: @contact_message) && @contact_message.save
      redirect_to contact_message_path(@contact_message)
    else
      render :new
    end
  end

  def show
    @contact_message = ContactMessage.find(params[:id])
  end

  def index
    @contact_messages = ContactMessage.all
  end

  private

    def contact_message_params
      params.require(:contact_message).permit(:email, :message)
    end

end
