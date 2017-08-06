require 'rails_helper'

RSpec.describe 'layouts/application', type: :view do

  before(:each) do
    render
  end

  it 'has a header section' do
    expect(rendered).to have_selector('nav')
  end

  it 'has a main section' do
    expect(rendered).to have_selector('main')

  end

  it 'has a footer section' do
    expect(rendered).to have_selector('footer')
  end

end
