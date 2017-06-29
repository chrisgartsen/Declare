RSpec.describe 'payment_types/index', type: :view do

  describe '#markup' do

    let(:breadcrumb) {view.content_for(:breadcrumb) }

    before(:each) do
      assign(:payment_types, [])
      render
    end

    it 'has a page header' do
      expect(rendered).to have_selector('.pageheader', text: 'Payment types')
    end

    it 'has a static reference to the index page' do
      expect(breadcrumb).to have_selector('.breadcrumb li.active', text: 'Payment types')
    end

  end

  describe '#table' do

    before(:each) do
      assign(:payment_types, [])
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
      @credit = FactoryGirl.create(:payment_type, :credit_card)
      @chip = FactoryGirl.create(:payment_type, :chip_card)
      assign(:payment_types, [@credit, @chip])
      render
    end

    it 'shows the correct number of payment types' do
      expect(rendered).to have_selector('tbody tr', count: 2)
    end

    it 'shows the name' do
      expect(rendered).to have_selector('tbody tr:first-child td#payment-type-name', text: @credit.name)
      expect(rendered).to have_selector('tbody tr:last-child td#payment-type-name', text: @chip.name)
    end

    it 'shows the created at' do
      expect(rendered).to have_selector('tbody tr:first-child td#payment-type-created-at', text: @credit.created_at)
      expect(rendered).to have_selector('tbody tr:last-child td#payment-type-created-at', text: @chip.created_at)
    end

  end

end
