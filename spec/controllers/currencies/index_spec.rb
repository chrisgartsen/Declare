RSpec.describe CurrenciesController, type: :controller do


  describe 'GET #index' do

    context 'when logged in' do

      it 'renders the index view'

      it 'returns the currencies'

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
