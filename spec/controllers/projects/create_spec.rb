RSpec.describe ProjectsController, type: :controller do

  describe 'POST #create' do

    context 'when not logged in' do

      it 'redirects to the login page' do
        session[:user_id] = nil
        post :create, params: {project: FactoryGirl.attributes_for(:project)}
        expect(response).to redirect_to login_path
      end

    end

    context 'when logged in' do

      before(:each) do
        @user = FactoryGirl.create(:user)
        session[:user_id] = @user.id
      end

      context 'with valid input' do

        it 'creates a project in the database' do
          expect {
            post :create, params: { project: FactoryGirl.attributes_for(:project) }
            }.to change(Project, :count).by(1)
        end

        it 'assignes the project to the current user' do
          post :create, params: { project: FactoryGirl.attributes_for(:project) }
          project = Project.last
          expect(project.user_id).to eq(user.id)
        end

        it 'redirects to the view page' do
          post :create, params: { project: FactoryGirl.attributes_for(:project) }
          project = Project.last
          expect(response).to redirect_to project_path(project)
        end

      end

      context 'with invalid input' do

        it 're-renders the create form' do
          post :create, params: { project: FactoryGirl.attributes_for(:project, :missing_name) }
          expect(response).to render_template(:new)
        end

        it 'does not create a project in the database' do
          expect {
            post :create, params: { project: FactoryGirl.attributes_for(:project, :missing_name) }
            }.not_to change(Project, :count)
        end

      end

    end

  end


end
