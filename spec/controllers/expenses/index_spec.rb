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

      it 'returns the users expenses' do
        @project = FactoryGirl.create(:project, user: @user)
        @expense_type = FactoryGirl.create(:expense_type)
        @payment_type = FactoryGirl.create(:payment_type)
        @currency = FactoryGirl.create(:currency)

        @first_expense = FactoryGirl.create(:expense, project: @project, expense_type: @expense_type,
                                                 payment_type: @payment_type, currency: @currency)
        @second_expense = FactoryGirl.create(:expense, project: @project, expense_type: @expense_type,
                                                 payment_type: @payment_type, currency: @currency)
        get :index
        expect(assigns(:expenses)).to match_array([@first_expense, @second_expense])

      end

      it 'does not return other users expenses' do
        @project = FactoryGirl.create(:project, user: FactoryGirl.create(:additional_user))
        @expense_type = FactoryGirl.create(:expense_type)
        @payment_type = FactoryGirl.create(:payment_type)
        @currency = FactoryGirl.create(:currency)
        @expense = FactoryGirl.create(:expense, project: @project, expense_type: @expense_type,
                                            payment_type: @payment_type, currency: @currency)
        get :index
        expect(assigns(:expenses)).not_to include(@expense)
      end
    end

  end

end
