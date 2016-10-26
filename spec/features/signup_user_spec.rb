require 'rails_helper'

RSpec.feature 'Signup user', type: :feature, js: true do

  context 'as a visitor' do

    it 'sign up and logs in the user' do

      visit root_path
      click_link 'Sign up'

     # expect(page.find('.header')).to have_content('Sign up')

    end

  end

end
