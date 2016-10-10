require 'rails_helper'

RSpec.describe 'static_pages/about', type: :view do

  before(:each) do
    render
  end

  it 'has a page title' do
    expect(rendered).to have_selector('.pageheader', text: 'About')
  end

end
