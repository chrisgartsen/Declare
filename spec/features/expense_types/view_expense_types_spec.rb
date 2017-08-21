RSpec.feature 'View list of expense types', type: :feature, js: true do

  context 'as an admin' do

    it 'shows the list of expense types' do
      cash = FactoryGirl.create(:expense_type, :cash_expense)
      login(FactoryGirl.create(:user, :admin))

      navigate_to_page
      check_page(cash)
    end

    private

    def navigate_to_page
      click_link 'config'
      click_link 'list-expense-types'
    end

    def check_page(expense_type)
      expect(page.find('.pageheader')).to have_content('Expense Types')
      expect(page).to have_content(expense_type.name)
    end

  end

end
