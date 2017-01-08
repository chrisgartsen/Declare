require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET #new' do

    it 'renders the new form template' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'returns a new user object' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end

  end

end
