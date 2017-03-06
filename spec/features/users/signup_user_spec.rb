require 'rails_helper'

RSpec.feature 'Signup user', type: :feature, js: true do

  context 'as a visitor' do

    it 'sign up and logs in the user' do
      user = FactoryGirl.build(:user)
      navigate_to_page
      fill_in_form(user)
      check_outcome(user)
    end

    private

      def navigate_to_page
        visit root_path
        click_link 'sign-up'
        expect(page.find('.pageheader')).to have_content('Sign up')
      end

      def fill_in_form(user)
        within('form') do
          fill_in 'user_name', with: user.name
          fill_in 'user_email', with: user.email
          fill_in 'user_password', with: user.password
          fill_in 'user_password_confirmation', with: user.password_confirmation
          click_button 'sign-up'
        end
      end

      def check_outcome(user)
        expect(page.find('.navbar-right')).to have_content(user.name)
      end

  end

end
12
