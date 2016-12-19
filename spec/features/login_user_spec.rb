require 'rails_helper'

RSpec.feature 'Login user', type: :feature, js: true do


  context'as a registered user' do

    it 'logs in the user' do

      visit root_path
      click_link 'Log in'

      expect(page.find('.pageheader')).to have_content('Log in')

      user = FactoryGirl.create(:user)

      within('form') do
        fill_in 'email', with: user.email
        fill_in 'password', with: user.password
        click_button 'login-button'
      end

      expect(page.find('.navbar-text')).to have_content(user.name)

    end

  end


end
