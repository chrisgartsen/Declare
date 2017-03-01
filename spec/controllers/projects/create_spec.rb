RSpec.describe ProjectsController, type: :controller do

  describe 'POST #create' do

    context 'when not logged in' do

      it 'redirects to the login page' do
        session[:user_id] = nil
        post :create, params: {project: FactoryGirl.attributes_for(:project)}
        expect(response).to redirect_to login_path
      end

    end

    context 'with valid input' do

      it 'creates a project in the database'

      it 'redirects to the index page'

    end

    context 'with invalid input' do

      it 're-renders the create form'

      it 'does not create a project in the database'

    end

  end


end
