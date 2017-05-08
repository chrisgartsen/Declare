RSpec.describe ContactMessagesController, type: :controller do

  context 'when not logged in' do

    it 'redirects to the login page as a guest' do
      session[:user_id] = nil
      get :index
      expect(response).to redirect_to(login_path)
    end

    it 'redirects to the login page as not an admin' do
      session[:user_id] = FactoryGirl.create(:user).id
      get :index
      expect(response).to redirect_to(login_path)
    end

  end

  context 'when logged in as an admin' do

    before(:each) do
      session[:user_id] = FactoryGirl.create(:user, :admin).id
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'returns contact messages' do
      message1 = FactoryGirl.create(:contact_message)
      message2 = FactoryGirl.create(:second_message)

      get :index
      expect(assigns(:contact_messages)).to match_array([message1, message2])
    end

  end

end
