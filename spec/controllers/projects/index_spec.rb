require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  describe 'GET #index' do

    context 'when logged in' do

      it 'renders the index view' do
        user = FactoryGirl.create(:user)
        session[:user_id] = user.id
        get :index
        expect(response).to render_template(:index)

      end

      it 'returns the projects for the user' do
        user = FactoryGirl.create(:user)
        session[:user_id] = user.id
        project_1 = FactoryGirl.create(:first_project, user_id: user.id)
        project_2 = FactoryGirl.create(:second_project, user_id: user.id)
        get :index
        expect(assigns(:projects)).to match_array([project_1, project_2])
      end

      it 'does not return projects from other users' do
        user = FactoryGirl.create(:user)
        additional_user = FactoryGirl.create(:additional_user)
        session[:user_id] = user.id
        project_1 = FactoryGirl.create(:first_project, user_id: user.id)
        project_2 = FactoryGirl.create(:second_project, user_id: additional_user.id)
        get :index
        expect(assigns{:projects}).not_to include(project_2)
      end
    end

    context 'when not logged in' do

      it 'redirects to the login page' do
        session[:user_id] = nil
        get :index
        expect(response).to redirect_to(login_path)
      end

    end

  end

end
