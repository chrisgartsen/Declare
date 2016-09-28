require 'rails_helper'

RSpec.describe 'StaticPagesRouting', :type => :routing do

  it 'routes to the about page' do
    expect(get('/about')).to route_to('static_pages#show', page: 'about')
    expect(get: about_path).to route_to('static_pages#show', page: 'about')
  end

  it 'routes to the contact page' do
    expect(get('/contact')).to route_to('static_pages#show', page: 'contact')
    expect(get: contact_path).to route_to('static_pages#show', page: 'contact')
  end

  it 'routes to the home page' do
    expect(get('/home')).to route_to('static_pages#show', page: 'home')
    expect(get: home_path).to route_to('static_pages#show', page: 'home')
  end

  it 'routes to the home page as root' do
    expect(get('/')).to route_to('static_pages#show', page: 'home')
    expect(get: root_path).to route_to('static_pages#show', page: 'home')
  end

end
