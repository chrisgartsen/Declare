RSpec.describe ContactMessagesController, type: :controller do

  describe 'GET #new' do

    it 'renders the new form template' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'returns a new contact_message object' do
      get :new
      expect(assigns(:contact_message)).to be_a_new(ContactMessage)
    end

  end

end
