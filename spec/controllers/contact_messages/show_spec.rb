RSpec.describe ContactMessagesController, type: :controller do

  describe 'GET #show' do

    it 'returns the requested contact message' do
      contact_message = FactoryGirl.create(:contact_message)
      get :show, params: { id: contact_message.id }
      expect(assigns(:contact_message)).to eq(contact_message)
    end

    it 'renders the show page' do
      contact_message = FactoryGirl.create(:contact_message)
      get :show, params: { id: contact_message.id }
      expect(response).to render_template(:show)
    end

    it 'returns an error if the requested message does not exist' do
      expect{
        get :show, params: { id: 9999 }
        }.to raise_error(ActiveRecord::RecordNotFound)
    end

  end

end

