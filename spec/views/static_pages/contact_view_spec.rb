require 'rails_helper'

RSpec.describe 'static_pages/contact', type: :view do

  before(:each) do
    render
  end

  it 'has a page title' do
    expect(rendered).to have_selector('.pageheader', text: 'Contact')
  end

end
