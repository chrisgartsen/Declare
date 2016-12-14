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

  end

  context 'when logged in' do

    before(:each) do
      @user = FactoryGirl.create(:user)
      session[:user_id] = @user.id
      render
    end

    it 'shows the username' do
      expect(rendered).to have_selector('p.navbar-text', text: @user.name)
    end

    it 'does not have a login button' do
      expect(rendered).not_to have_selector('a', text: "Log in")
    end

  end

end
