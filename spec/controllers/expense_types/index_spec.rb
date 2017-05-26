RSpec.describe ExpenseTypesController, type: :controller do

  describe 'GET #index' do

    context 'when logged in as an admin' do

      it 'renders the index view' do
        set_authentication(FactoryGirl.create(:user, :admin))
        get :index
        expect(response).to render_template(:index)
      end

      it 'returns the expense types' do
        set_authentication(FactoryGirl.create(:user, :admin))
        cash = FactoryGirl.create(:expense_type, :cash_expense)
        hotel = FactoryGirl.create(:expense_type, :hotel_expense)
        get :index
        expect(assigns(:expense_types)).to match_array([cash, hotel])
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
