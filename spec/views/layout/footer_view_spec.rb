require 'rails_helper'

RSpec.describe 'layouts/_footer' do

  describe '#markup' do

    before(:each) do
      render
    end

    it 'has a footer element' do
      expect(rendered).to have_selector('footer')
    end

    it 'has a list with links' do
      expect(rendered).to have_selector('ul')
    end

    it 'has a link to the about page' do
      expect(rendered).to have_link('About', href: about_path)
    end

    it 'has a link to the contact page' do
      expect(rendered).to have_link('Contact', href: contact_path)
    end

  end

end
