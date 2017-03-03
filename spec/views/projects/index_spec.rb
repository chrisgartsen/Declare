require 'rails_helper'

RSpec.describe 'projects/index', type: :view do


  describe '#markup' do

    let(:breadcrumb) {view.content_for(:breadcrumb) }

    before(:each) do
      assign(:projects, [])
      render
    end

    it 'has a page header' do
      expect(rendered).to have_selector('.pageheader', text: 'Projects')
    end

    it 'has a static reference to the index page' do
      expect(breadcrumb).to have_selector('.breadcrumb li.active', text: 'Projects')
    end

    it 'has a Add new project button' do
      expect(rendered).to have_link('Add project', href: new_project_path)
    end

  end

  describe '#table' do

    before(:each) do
      assign(:projects, [])
      render
    end

    it_behaves_like 'a table'


  end

  describe '#table content' do


  end

end
