require 'rails_helper'

RSpec.describe AccountsController, type: :controller do

  describe 'GET #show' do

    context 'when logged in' do

      it 'returns the current user object' do
        user = FactoryGirl.create(:user)
        session[:user_id] = user.id
        get :show
        expect(assigns(:user)).to eq user

      end

      it 'it renders the show page' do
        user = FactoryGirl.create(:user)
        session[:user_id] = user.id
        get :show
        expect(response).to render_template(:show)
      end

    end

    context 'when not logged in' do

      it 'redirects to the login page' do
        session[:user_id] = nil
        get :show
        expect(response).to redirect_to(login_path)
      end

    end

  end

end
