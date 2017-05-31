RSpec.feature 'View list of currencies', type: :feature, js: true do

  context 'as an admin' do

    it 'shows the list of currencies' do
      usd = FactoryGirl.create(:currency, :usd)
      login(FactoryGirl.create(:user, :admin))

      navigate_to_page
      check_page(usd)
    end

    private

    def navigate_to_page
      click_link 'config'
      click_link 'list-currencies'
    end

    def check_page(currency)
      expect(page.find('.pageheader')).to have_content('Currencies')
      expect(page).to have_content(currency.name)
    end

  end

end
