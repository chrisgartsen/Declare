require 'rails_helper'

RSpec.feature 'Login and logout user', type: :feature, js: true do


  context'as a registered user' do

    it 'logs in the user and logs out again' do
      user = FactoryGirl.create(:user)
      navigate_to_page
      login(user)
      check_login(user)
      logout
      check_logout(user)
    end

    private

      def navigate_to_page
        visit root_path
        click_link 'log-in'
        expect(page.find('.pageheader')).to have_content('Log in')
      end

      def login(user)
        within('form') do
          fill_in 'email', with: user.email
          fill_in 'password', with: user.password
          click_button 'login-button'
        end
      end

      def check_login(user)
        expect(page.find('.navbar-right')).to have_content(user.name)
      end

      def logout
        click_link 'log-out'
      end

      def check_logout(user)
        expect(page.find('.navbar-right')).not_to have_content(user.name)
        expect(page.find('.pageheader')).to have_content('Log in')
      end

  end

end
