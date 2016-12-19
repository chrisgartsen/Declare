require 'rails_helper'

RSpec.describe 'SessionsRouting', type: :routing do

  it 'routes to the login page' do
    expect(get('/login')).to route_to('sessions#new')
    expect(get: login_path).to route_to('sessions#new')
  end

  it 'routes to logout' do
    expect(get('/logout')).to route_to('sessions#destroy')
    expect(get: logout_path).to route_to('sessions#destroy')
  end

  it 'routes to '


end
