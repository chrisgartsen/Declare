require 'rails_helper'

RSpec.feature 'Create First Project', type: :feature, js: true do

  context 'when the user has no existing projects' do

    xit 'redirects to the create project page after login' do
      user = FactoryGirl.create(:user)
      login(user)
      expect(page.find('.header')).to have_content('Create project')
    end

  end

  context 'when the user has existing projects' do

    xit 'shows the dashboard page after login' do
      user = FactoryGirl.create(:user)
      FactoryGirl.create(:project, user_id: user.id)
      login(user)
      expect(page.find('.header')).to have_content('Project overview')
    end

  end

  private

  def login(user)
    visit root_path
    click_link 'Log in'
    within('form') do
      fill_in 'email', with: user.email
      fill_in 'password', with: user.password
      click_button 'login-button'
    end
  end


end
