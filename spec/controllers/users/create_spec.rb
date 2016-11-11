require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'POST #create' do

    context 'with valid input' do

      it 'redirects to the home page'

      it 'logs in as the created user'

      it 'creates and stores the user in the database'

    end

    context 'with invalid input' do

      it 're-renders the sign up form'

      it 'does not store the user in the database'

      it 'does not log in the user'

    end

  end

end
