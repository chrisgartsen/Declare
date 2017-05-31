RSpec.describe ExpenseTypesController, type: :controller do

  describe 'GET #index' do

    it_behaves_like 'an admin index action'

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

  end

end
