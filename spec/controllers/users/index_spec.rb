require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET #index' do

    context 'when not logged in' do

      it 'redirects to the login page' do
        session[:user_id] = nil
        get :index
        expect(response).to redirect_to(login_path)
      end

    end

    context 'when logged in' do

      before(:each) do
        @admin = FactoryGirl.create(:user, :admin)
        session[:user_id] = @admin.id
      end

      it 'renders the index template' do
        get :index
        expect(response).to render_template :index
      end

      it 'returns the users' do
        user = FactoryGirl.create(:additional_user)
        get :index
        expect(assigns(:users)).to match_array([@admin, user])
      end

    end

  end

end
