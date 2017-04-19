class ContactMessagesController < ApplicationController
  def new
    @contact_message = ContactMessage.new
  end
end
