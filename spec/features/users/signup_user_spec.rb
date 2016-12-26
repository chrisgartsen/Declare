require 'rails_helper'

RSpec.feature 'Signup user', type: :feature, js: true do

  context 'as a visitor' do

    it 'sign up and logs in the user' do

      visit root_path
      click_link 'Sign up'

      expect(page.find('.pageheader')).to have_content('Sign up')

      user = FactoryGirl.build(:user)

      within('form') do
        fill_in 'user_name', with: user.name
        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: user.password
        fill_in 'user_password_confirmation', with: user.password_confirmation
        click_button 'Sign up'
      end

      expect(page.find('.navbar-text')).to have_content(user.name)

    end

  end

end
