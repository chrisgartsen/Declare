require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  describe 'GET #index' do

    context 'when logged in' do

      before(:each) do
        @user = FactoryGirl.create(:user)
        set_authentication(@user)
      end

      it 'renders the index view' do
        get :index
        expect(response).to render_template(:index)
      end

      it 'returns the projects for the user' do
        project_1 = FactoryGirl.create(:first_project, user_id: @user.id)
        project_2 = FactoryGirl.create(:second_project, user_id: @user.id)
        get :index
        expect(assigns(:projects)).to match_array([project_1, project_2])
      end

      it 'does not return projects from other users' do
        additional_user = FactoryGirl.create(:additional_user)
        project_1 = FactoryGirl.create(:first_project, user_id: @user.id)
        project_2 = FactoryGirl.create(:second_project, user_id: additional_user.id)
        get :index
        expect(assigns{:projects}).not_to include(project_2)
      end
    end

    context 'when not logged in' do

      it 'redirects to the login page' do
        clear_authentication
        get :index
        expect(response).to redirect_to(login_path)
      end

    end

  end

end
