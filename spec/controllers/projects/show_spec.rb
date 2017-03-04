RSpec.describe ProjectsController, type: :controller do

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
        session[:user_id] = project.user.id
        get :show, params: { id: project.id}
        expect(assigns(:project)).to eq(project)
      end

      it 'renders the show page' do
        project = FactoryGirl.create(:project)
        session[:user_id] = project.user.id
        get :show, params: { id: project.id}
        expect(response).to render_template(:show)
      end

      it 'returns an error when the project does not exist' do
        session[:user_id] = FactoryGirl.create(:user).id
        expect {
          get :show, params: {id: 9999 }
          }.to raise_error ActiveRecord::RecordNotFound
      end

      it 'returns an error when user does not own the project' do
        project = FactoryGirl.create(:project)
        session[:user_id] = FactoryGirl.create(:additional_user).id
        expect {
          get :show, params: {id: project.id }
          }.to raise_error ActiveRecord::RecordNotFound
      end

    end

  end

end
