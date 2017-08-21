RSpec.feature 'View list of payment types', type: :feature, js: true do

  context 'as an admin' do

    it 'shows the list of payment types' do
      credit = FactoryGirl.create(:payment_type, :credit_card)
      login(FactoryGirl.create(:user, :admin))

      navigate_to_page
      check_page(credit)
    end

    private

    def navigate_to_page
      click_link 'config'
      click_link 'list-payment-types'
    end

    def check_page(payment_type)
      expect(page.find('.pageheader')).to have_content('Payment Types')
      expect(page).to have_content(payment_type.name)
    end

  end

end
