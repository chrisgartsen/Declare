RSpec.describe 'expense_types/index', type: :view do


  describe '#markup' do

    let(:breadcrumb) {view.content_for(:breadcrumb) }

    before(:each) do
      assign(:expense_types, [])
      render
    end

    it 'has a page header' do
      expect(rendered).to have_selector('.pageheader', text: 'Expense types')
    end

    it 'has a static reference to the index page' do
      expect(breadcrumb).to have_selector('.breadcrumb li.active', text: 'Expense types')
    end

  end

  describe '#table' do

    before(:each) do
      assign(:expense_types, [])
      render
    end

    it_behaves_like 'a table'

    it 'shows column headers' do
      expect(rendered).to have_selector 'th', text: 'Name'
      expect(rendered).to have_selector 'th', text: 'Created at'
    end

  end

  describe '#table content' do

    before(:each) do
      session[:user_id] = FactoryGirl.create(:user, :admin).id
      @cash = FactoryGirl.create(:expense_type, :cash_expense)
      @hotel = FactoryGirl.create(:expense_type, :hotel_expense)
      assign(:expense_types, [@cash, @hotel])
      render
    end

    it 'shows the correct number of expense types' do
      expect(rendered).to have_selector('tbody tr', count: 2)
    end

    it 'shows the name' do
      expect(rendered).to have_selector('tbody tr:first-child td#expense-type-name', text: @cash.name)
      expect(rendered).to have_selector('tbody tr:last-child td#expense-type-name', text: @hotel.name)
    end

    it 'shows the created at' do
      expect(rendered).to have_selector('tbody tr:first-child td#expense-type-created-at', text: @cash.created_at)
      expect(rendered).to have_selector('tbody tr:last-child td#expense-type-created-at', text: @hotel.created_at)
    end

  end

end
