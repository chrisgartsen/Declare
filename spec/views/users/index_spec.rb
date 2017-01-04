require 'rails_helper'

RSpec.describe 'users/index', type: :view do

  describe '#markup' do

    before(:each) do
      assign(:users, [])
      render
    end

    it 'has a page header' do
      expect(rendered).to have_selector('.pageheader', text: 'Users')
    end

  end

  describe '#table' do

    before(:each) do
      assign(:users, [])
      render
    end

    it 'has a table' do
      expect(rendered).to have_selector 'table.table'
    end

    it 'has a table head section' do
      expect(rendered).to have_selector 'thead'
    end

    it 'has a table body section' do
      expect(rendered).to have_selector 'tbody'
    end

    it 'shows column headers' do
      expect(rendered).to have_selector 'th', text: 'Name'
      expect(rendered).to have_selector 'th', text: 'Email'
      expect(rendered).to have_selector 'th', text: 'Admin'
      expect(rendered).to have_selector 'th', text: 'Created at'
      expect(rendered).to have_selector 'th', text: 'Updated at'
    end

  end

  describe '#table content' do


  end

end
