RSpec.describe DashboardsController do

  describe 'GET #index' do

    context 'when not logged in' do

      it 'redirects to the login page' do
        clear_authentication
        get :index
        expect(response).to redirect_to(login_path)
      end

    end

    context 'when logged in' do

      it 'returns the users dashboard object' do
        user = FactoryGirl.create(:user)
        set_authentication(user)
        get :index
        expect(assigns(:dashboard).user_name).to eq(user.name)
      end

      it 'returns the users projects' do
        user = FactoryGirl.create(:user)
        project = FactoryGirl.create(:project, user: user)
        set_authentication(user)
        get :index
        expect(assigns(:dashboard).projects).to match_array([project])
      end

      it 'renders the index page' do
        set_authentication(FactoryGirl.create(:user))
        get :index
        expect(response).to render_template(:index)
      end

    end

  end

end
