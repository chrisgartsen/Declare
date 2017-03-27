RSpec.describe ProjectsController, type: :controller do

  describe 'GET #edit' do

    context 'when not logged in' do

      it 'redirects to the login page' do
        clear_authentication
        project = FactoryGirl.create(:project)
        get :edit, params: {id: project.id}
        expect(response).to redirect_to login_path
      end

    end

    context 'when logged in' do

      it 'renders the edit template' do
        project = FactoryGirl.create(:project)
        set_authentication(project.user)
        get :edit, params: {id: project.id}
        expect(response).to render_template(:edit)
      end

      it 'returns the requested project' do
        project = FactoryGirl.create(:project)
        set_authentication(project.user)
        get :edit, params: {id: project.id}
        expect(assigns(:project)).to eq project
      end

      it 'does not return another users project' do
        project = FactoryGirl.create(:project)
        set_authentication(FactoryGirl.create(:additional_user))
        expect{
          get :edit, params: {id: project.id}
          }.to raise_error ActiveRecord::RecordNotFound
      end

    end

  end

end
