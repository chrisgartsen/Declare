RSpec.describe PaymentTypesController, type: :controller do

  describe 'GET #index' do

    it_behaves_like 'an admin index action'

    context 'when logged in as an admin' do

      it 'renders the index view' do
        set_authentication(FactoryGirl.create(:user, :admin))
        get :index
        expect(response).to render_template(:index)
      end

      it 'returns the payment types' do
        set_authentication(FactoryGirl.create(:user, :admin))
        chip = FactoryGirl.create(:payment_type, :chip_card)
        card = FactoryGirl.create(:payment_type, :credit_card)
        get :index
        expect(assigns(:payment_types)).to match_array([chip, card])
      end

    end

  end

end
