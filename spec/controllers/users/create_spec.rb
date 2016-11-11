require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'POST #create' do

    context 'with valid input' do

      it 'redirects to the home page' do
        post :create, params: {user: FactoryGirl.attributes_for(:user)}
        expect(response).to redirect_to(root_path)
      end

      it 'logs in as the created user' do
        post :create, params: {user: FactoryGirl.attributes_for(:user)}
        expect(session[:user_id]).to eq(User.last.id)
      end

      it 'creates and stores an object in the database' do
        expect {
          post :create, params: {user: FactoryGirl.attributes_for(:user)}
        }.to change(User, :count).by(1)
      end

      it 'creates the user with the passed parameters' do
        post :create, params: {user: FactoryGirl.attributes_for(:user, name: 'PARAM NAME')}
        user_new = FactoryGirl.build(:user, name: 'PARAM NAME')
        user_created = User.last
        expect(user_created.name).to eq(user_new.name)
        expect(user_created.email).to eq(user_new.email)
      end

    end

    context 'with invalid input' do

      it 're-renders the sign up form'

      it 'does not store the user in the database'

      it 'does not log in the user'

    end

  end

end
