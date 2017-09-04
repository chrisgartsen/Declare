require 'rails_helper'

RSpec.describe 'static_pages/contact', type: :view do

  describe '#breadcrumb' do

    let(:breadcrumb) { view.content_for(:breadcrumb) }

    before(:each) do
      render
    end

    it 'has a static reference to the contact page' do
      expect(breadcrumb).to have_selector('.breadcrumb li.is-active a', text: 'Contact')
    end

  end

  describe '#markup' do

    before(:each) do
      render
    end

    it 'has a page title' do
      expect(rendered).to have_selector('.pageheader', text: 'Contact')
    end

  end
end
