require 'rails_helper'

RSpec.describe "sessions/new.html.erb", type: :view do

  describe '#breadcrumb' do

    let(:breadcrumb) {view.content_for(:breadcrumb) }

    it 'has a static reference to the login page' do
      render
      expect(breadcrumb).to have_selector('.breadcrumb li.is-active a', text: 'Sign in')
    end

  end

  describe '#content' do

    it 'has a pageheader' do
      render
      expect(rendered).to have_selector('.pageheader', text: 'Sign in')
    end

    it 'has a signup link' do
      render
      expect(rendered).to have_selector('a', text: 'Sign up')
    end

  end

  describe '#form' do

    before(:each) do
      render
    end

    it 'has a form' do
      expect(rendered).to have_selector('form')
    end

    it 'has an email textfield' do
      expect(rendered).to have_selector("input[type='text']#email")
    end

    it 'has a password field' do
      expect(rendered).to have_selector("input[type='password']#password")
    end

    it 'has a login button' do
      expect(rendered).to have_selector("button[type='submit']")
    end

    it 'does not show an error panel' do
      expect(rendered).not_to have_selector('article.message.is-danger')
    end

  end

  describe '#form with errors' do

    before(:each) do
      flash[:error] = 'Login failed'
      render
    end

    it 'has an error panel' do
      expect(rendered).to have_selector('article.message.is-danger')
    end

    it 'shows an error header' do
      expect(rendered).to have_selector('strong', text: 'A problem has occurred while signing in.')
    end

    it 'shows an error subheader' do
      expect(rendered).to have_selector('div.message-body', text: 'Login failed')
    end

  end

end
