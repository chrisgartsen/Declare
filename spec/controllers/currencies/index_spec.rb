RSpec.describe CurrenciesController, type: :controller do

  describe 'GET #index' do

    context 'when logged in as an admin' do

      it 'renders the index view' do
        set_authentication(FactoryGirl.create(:user, :admin))
        get :index
        expect(response).to render_template(:index)
      end

      it 'returns the currencies' do
        set_authentication(FactoryGirl.create(:user, :admin))
        usd = FactoryGirl.create(:currency, :usd)
        eur = FactoryGirl.create(:currency, :euro)
        get :index
        expect(assigns(:currencies)).to match_array([usd, eur])
      end

    end

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

end
