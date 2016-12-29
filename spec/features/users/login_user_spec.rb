require 'rails_helper'

RSpec.feature 'Login and logout user', type: :feature, js: true do


  context'as a registered user' do

    it 'logs in the user and logs out again' do

      visit root_path
      click_link 'Log in'

      expect(page.find('.pageheader')).to have_content('Log in')

      user = FactoryGirl.create(:user)

      within('form') do
        fill_in 'email', with: user.email
        fill_in 'password', with: user.password
        click_button 'login-button'
      end

      expect(page.find('.navbar-right')).to have_content(user.name)

      click_link 'Log out'

      expect(page.find('.navbar-right')).not_to have_content(user.name)
      expect(page.find('.pageheader')).to have_content('Log in')

    end

  end


end
