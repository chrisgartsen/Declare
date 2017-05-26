RSpec.shared_examples 'an admin index action' do

  context 'when logged in as a user' do

    it 'redirects to the login page' do
      set_authentication(FactoryGirl.create(:user))
      get :index
      expect(response).to redirect_to(login_path)
    end

  end

  context 'when not logged in' do

    it 'redirects to the login page' do
      clear_authentication
      get :index
      expect(response).to redirect_to(login_path)
    end

  end

end
