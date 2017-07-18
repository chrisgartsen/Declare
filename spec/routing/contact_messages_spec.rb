RSpec.describe 'ContactMessagesRouting', type: :routing do

  it 'routes to the contact page' do
    expect(get('/contact')).to route_to('contact_messages#new')
    expect(get: contact_path).to route_to('contact_messages#new')
  end


end
