RSpec.describe ExpensesController, type: :controller do

  describe 'GET #index' do

    context 'when not logged in' do

      it 'redirects to the login page' do
        clear_authentication
        get :index
        expect(response).to redirect_to(login_path)
      end

    end

    context 'when logged in' do

      before(:each) do
        @user = FactoryGirl.create(:user)
        set_authentication(@user)
      end

      it 'renders the index view' do
        get :index
        expect(response).to render_template(:index)
      end

      it 'returns the users expenses'

      it 'does not return other users expenses'

    end

  end

end
