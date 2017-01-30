require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  describe 'GET #new' do

    context 'when not logged in' do
      it 'redirects to the login page' do
        session[:user_id] = nil
        get :new
        expect(response).to redirect_to(login_path)
      end
    end

    context 'when logged in' do

      it 'renders the new form template' do
        user = FactoryGirl.create(:user)
        session[:user_id] = user.id
        get :new
        expect(response).to render_template(:new)
      end

      it 'returns a new project object' do
        user = FactoryGirl.create(:user)
        session[:user_id] = user.id
        get :new
        expect(assigns(:project)).to be_a_new(Project)
        expect(assigns(:project).user_id).to eq(user.id)
      end

    end

  end

end
