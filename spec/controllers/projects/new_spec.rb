require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  describe 'GET #new' do

    context 'when not logged in' do
      it 'redirects to the login page' do
        clear_authentication
        get :new
        expect(response).to redirect_to(login_path)
      end
    end

    context 'when logged in' do

      before(:each) do
        @user = FactoryGirl.create(:user)
        set_authentication(@user)
      end

      it 'renders the new form template' do
        get :new
        expect(response).to render_template(:new)
      end

      it 'returns a new project object' do
        get :new
        expect(assigns(:project)).to be_a_new(Project)
        expect(assigns(:project).user_id).to eq(@user.id)
      end

    end

  end

end
