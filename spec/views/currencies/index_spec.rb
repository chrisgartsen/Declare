RSpec.describe 'currencies/index', type: :view do


  describe '#markup' do

    let(:breadcrumb) {view.content_for(:breadcrumb) }

    before(:each) do
      assign(:currencies, [])
      render
    end

    it 'has a page header' do
      expect(rendered).to have_selector('.pageheader', text: 'Currencies')
    end

    it 'has a static reference to the index page' do
      expect(breadcrumb).to have_selector('.breadcrumb li.active', text: 'Currencies')
    end

  end

  describe '#table' do

    before(:each) do
      assign(:currencies, [])
      render
    end

    it_behaves_like 'a table'

    it 'shows column headers' do
      expect(rendered).to have_selector 'th', text: 'Code'
      expect(rendered).to have_selector 'th', text: 'Name'
      expect(rendered).to have_selector 'th', text: 'Created at'
    end

  end

  describe '#table content' do

    before(:each) do
      session[:user_id] = FactoryGirl.create(:user, :admin).id
      @eur = FactoryGirl.create(:currency, :euro)
      @usd = FactoryGirl.create(:currency, :usd)
      assign(:currencies, [@eur, @usd])
      render
    end

    it 'shows the correct number of currencies' do
      expect(rendered).to have_selector('tbody tr', count: 2)
    end

    it 'shows the code' do
      expect(rendered).to have_selector('tbody tr:first-child td#currency-code', text: @eur.code)
      expect(rendered).to have_selector('tbody tr:last-child td#currency-code', text: @usd.code)
    end

    it 'shows the name' do
      expect(rendered).to have_selector('tbody tr:first-child td#currency-name', text: @eur.name)
      expect(rendered).to have_selector('tbody tr:last-child td#currency-name', text: @usd.name)
    end

    it 'shows the created at' do
      expect(rendered).to have_selector('tbody tr:first-child td#currency-created-at', text: @eur.created_at)
      expect(rendered).to have_selector('tbody tr:last-child td#currency-created-at', text: @usd.created_at)
    end

  end

end
