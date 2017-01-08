require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe 'POST #create' do

    context 'with correct crendentials' do

      it 'redirects to the home page' do
        user = FactoryGirl.create(:user)
        post :create, params: { email: user.email, password: user.password }
        expect(response).to redirect_to(root_path)
      end

      it 'stores the userid in session' do
        user = FactoryGirl.create(:user)
        post :create, params: { email: user.email, password: user.password }
        expect(session[:user_id]).to eq(user.id)
      end

    end

    context 'with incorrect password' do

      before(:each) do
        user = FactoryGirl.create(:user)
        post :create, params: {email: user.email, password: 'WRONG'}
      end

      it 'does not store the user id in session' do
        expect(session[:user_id]).to be_nil
      end

      it 're-renders the login form' do
        expect(response).to render_template(:new)
      end

      it 'returns a flash error' do
        expect(flash[:error]).to be_present
      end

    end

    context 'with unknown user' do

      before(:each) do
        post :create, params: {email: 'UNKNOWN', password: nil}
      end

      it 'does not store the user id in session' do
        expect(session[:user_id]).to be_nil
      end

      it 're-renders the login form' do
        expect(response).to render_template(:new)
      end

      it 'returns a flash error' do
        expect(flash[:error]).to be_present
      end

    end

  end
end
