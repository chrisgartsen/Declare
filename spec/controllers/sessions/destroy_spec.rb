require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe 'DELETE #destroy' do

    before(:each) do
      user = FactoryGirl.create(:user)
      session[:user_id] = user.id
      delete :destroy
    end

    it 'redirects to the login page' do
        expect(response).to redirect_to login_path
    end

    it 'clears the userid from the session' do
      expect(session[:user_id]).to be_nil
    end

  end

end
