RSpec.describe DashboardsController do

  describe 'GET #show' do

    context 'when not logged in' do

      it 'redirects to the login page' do
        clear_authentication
        get :show
        expect(response).to redirect_to(login_path)
      end

    end

    context 'when logged in' do

      it 'returns the users dashboard object' do
        user = FactoryGirl.create(:user)
        set_authentication(user)
        get :show
        expect(assigns(:dashboard).user_name).to eq(user.name)
      end

      it 'renders the show page' do
        set_authentication(FactoryGirl.create(:user))
        get :show
        expect(response).to render_template(:show)
      end

    end

  end

end
