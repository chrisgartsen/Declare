require 'rails_helper'

RSpec.describe 'layouts/_header', type: :view do

  before(:each) do
    render
  end

  it 'has a header element' do
    expect(rendered).to have_selector('header')
  end

  it 'has a navbar' do
    expect(rendered).to have_selector('.navbar')
  end

  it 'has a navbar header' do
    expect(rendered).to have_selector('.navbar-header')
  end

  it 'has a list of links' do
    expect(rendered).to have_selector('ul.navbar-nav')
  end

end
