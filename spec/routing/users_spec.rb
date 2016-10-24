require 'rails_helper'

RSpec.describe 'UsersRouting', type: :routing do

  it 'routes to the signup page' do
    expect(get('/signup')).to route_to('users#new')
    expect(get: signup_path).to route_to('users#new')
  end

end
