require 'rails_helper'

RSpec.feature 'Manage account', type: :feature, js: true do

  context 'as a user' do

  it 'shows the user info' do
      user = FactoryGirl.create(:user)

      visit root_path
      click_link 'Log in'

      within('form') do
        fill_in 'email', with: user.email
        fill_in 'password', with: user.password
        click_button 'login-button'
      end

      click_link user.name

      expect(page.find('.pageheader')).to have_content('Account information')
      expect(page).to have_content(user.email)

    end

  end

end
