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

    before(:each) do
      @first_user = FactoryGirl.create(:user)
      @second_user = FactoryGirl.create(:user, :additional_user)
      assign(:users, [@first_user, @second_user])
      render
    end

    it 'shows the correct number of users' do
      expect(rendered).to have_selector('tbody tr', count: 2)
    end

    it 'shows the name' do
      expect(rendered).to have_selector('tbody tr:first-child td#user-name', text: @first_user.name)
      expect(rendered).to have_selector('tbody tr:last-child td#user-name', text: @second_user.name)
    end

    it 'shows the email' do
      expect(rendered).to have_selector('tbody tr:first-child td#user-admin', text: @first_user.admin)
      expect(rendered).to have_selector('tbody tr:last-child td#user-admin', text: @second_user.admin)
    end

    it 'shows the created_at' do
      expect(rendered).to have_selector('tbody tr:first-child td#user-created-at', text: @first_user.created_at)
      expect(rendered).to have_selector('tbody tr:last-child td#user-created-at', text: @second_user.created_at)
    end

    it 'shows the updated_at' do
      expect(rendered).to have_selector('tbody tr:first-child td#user-updated-at', text: @first_user.updated_at)
      expect(rendered).to have_selector('tbody tr:last-child td#user-updated-at', text: @second_user.updated_at)
    end

  end

end
