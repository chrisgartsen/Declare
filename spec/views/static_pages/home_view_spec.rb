require 'rails_helper'

RSpec.describe 'static_pages/home', type: :view do

  before(:each) do
    render
  end

  it 'has a page title' do
    expect(rendered).to have_selector('.pageheader', text: 'Manage your expenses')
  end

  it 'has a signup link' do
    expect(rendered).to have_link('Sign up', href: signup_path)
  end

end
