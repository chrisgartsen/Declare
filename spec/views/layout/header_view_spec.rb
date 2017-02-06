require 'rails_helper'

RSpec.describe 'layouts/_header', type: :view do

  context 'markup' do

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

  context 'when not logged in' do

    before(:each) do
      session[:user_id] = nil
      render
    end

    it 'has a login button' do
      expect(rendered).to have_selector('a', text: "Log in")
    end

    it 'does not have a logout button' do
      expect(rendered).not_to have_selector('a', text: "Log out")
    end

    it 'does not have a projects link' do
      expect(rendered).not_to have_selector('a', text: "Projects")
    end

  end

  context 'when logged in as user' do

    before(:each) do
      @user = FactoryGirl.create(:user)
      session[:user_id] = @user.id
      render
    end

    it 'has a link to the user account' do
      expect(rendered).to have_link(@user.name, href: '/accounts/show')
    end

    it 'has a logout button' do
      expect(rendered).to have_selector('a', text: "Log out")
    end

    it 'does not have a login button' do
      expect(rendered).not_to have_selector('a', text: "Log in")
    end

    it 'does not have a view all users link' do
      expect(rendered).not_to have_link('Users', href: users_path)
    end

    it 'has a projects link' do
      expect(rendered).to have_link('Projects', href: projects_path)
    end

  end

  context 'when logged in as admin' do

    before(:each) do
      @admin = FactoryGirl.create(:user, :admin)
      session[:user_id] = @admin.id
      render
    end

    it 'has a view all users link' do
      expect(rendered).to have_link('Users', href: users_path)
    end

  end

end
