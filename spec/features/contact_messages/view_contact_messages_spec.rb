RSpec.feature 'View contact messages', type: :feature, js: true do

  context 'as an administrator' do

    before(:each) do
      @admin = FactoryGirl.create(:user, :admin)
      @contact_message = FactoryGirl.create(:contact_message)
    end

    it 'allows me to view all contact messages' do
      login_as_admin
      navigate_to_page
      check_content
    end

    private

    def login_as_admin
      login(@admin)
    end

    def navigate_to_page
      click_link 'list-contact-messages'
    end

    def check_content
      expect(page.find('.pagheader')).to have_content('Contact messages')
      expect(page.find('table')).to have_content(@contact_message.email)
      expect(page.find('table')).to have_content(@contact_message.message)
    end

  end

end
