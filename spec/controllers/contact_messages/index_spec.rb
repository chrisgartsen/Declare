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

  end

end
