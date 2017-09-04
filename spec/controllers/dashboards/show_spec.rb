RSpec.describe DashboardsController do

  describe 'GET #show' do

    context 'when not logged in' do

      it 'redirects to the login page' do
        clear_authentication
        project = FactoryGirl.create(:project)
        get :show, params: {id: project.id}
        expect(response).to redirect_to(login_path)
      end

    end

    context 'when logged in' do

      it 'returns the requested project' do
        project = FactoryGirl.create(:project)
        set_authentication(project.user)
        get :show, params: { id: project.id}
        expect(assigns(:project)).to eq(project)
      end

      it 'renders the show page' do
        project = FactoryGirl.create(:project)
        set_authentication(project.user)
        get :show, params: { id: project.id}
        expect(response).to render_template(:show)
      end

      it 'returns an error when the project does not exist' do
       set_authentication(FactoryGirl.create(:user))
        expect {
          get :show, params: {id: 9999 }
          }.to raise_error ActiveRecord::RecordNotFound
      end

      it 'returns an error when user does not own the project' do
        project = FactoryGirl.create(:project)
        set_authentication(FactoryGirl.create(:additional_user))
        expect {
          get :show, params: {id: project.id }
          }.to raise_error ActiveRecord::RecordNotFound
      end

    end

  end

end
