RSpec.describe CurrenciesController, type: :controller do

  describe 'GET #index' do

    it_behaves_like 'an admin index action'

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

  end

end
