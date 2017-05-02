RSpec.feature 'Send a contact mesage', type: :feature, js: true do

  context 'as a visitor' do

    it 'allows me to enter and send a contact message' do
      navigate_to_contact_page
      fill_in_contact_form
      check_confirmation_message
    end

    private

    def navigate_to_contact_page
      visit root_path
      click_link 'Contact'
      expect(page.find('.pageheader')).to have_content('Contact')
    end

    def fill_in_contact_form
      within 'form' do
        fill_in 'Email', with: 'email@email.com'
        fill_in 'Message', with: 'A message'
        click_button 'Send message'
      end
    end

    def check_confirmation_message
      expect(page.find('.pageheader')).to have_content('Contact')
      expect(page).to have_content('Your message has been sent.')
      expect(page).to have_content('A message')
    end

  end

end
