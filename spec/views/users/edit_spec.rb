require 'rails_helper'

RSpec.describe 'users/edit', type: :view do

  describe '#markup' do

    before(:each) do
      @user = FactoryGirl.create(:user)
      assign(:user, @user)
      render
    end

    it 'has a page header' do
      expect(rendered).to have_selector('.pageheader', text: 'Manage account')
    end

  end

  describe '#content' do

    before(:each) do
      @user = FactoryGirl.create(:user)
      assign(:user, @user)
      render
    end

    it 'shows the user name' do
      expect(rendered).to have_selector('.form-control-static', text: @user.name)
    end

    it 'shows the user email' do
      expect(rendered).to have_selector('.form-control-static', text: @user.email)
    end

  end

end
