require 'rails_helper'

RSpec.describe UsersController, type: :controller do


  describe 'GET #edit' do

    context 'when not logged in' do

      it 'redirects to the login page' do
        user = FactoryGirl.create(:user)
        session[:user_id] = nil
        get :edit, params: { id: user.id }
        expect(response).to redirect_to(login_path)
      end

    end

    context 'when not the correct user' do

      it 'it still returns the logged in user' do
        first_user = FactoryGirl.create(:user)
        second_user = FactoryGirl.create(:user, :additional_user)
        session[:user_id] = first_user.id
        get :edit, params: { id: second_user.id }
        expect(assigns(:user)).to eq(first_user)
      end

    end

    context 'when the correct user' do

      it 'renders the manage user page' do
        user = FactoryGirl.create(:user)
        session[:user_id] = user.id
        get :edit, params: { id: user.id }
        expect(response).to render_template(:edit)
      end

      it 'returns the user' do
        user = FactoryGirl.create(:user)
        session[:user_id] = user.id
        get :edit, params: { id: user }
        expect(assigns(:user)).to eq(user)
      end

    end

  end

end
