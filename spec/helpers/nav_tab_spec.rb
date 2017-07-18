RSpec.describe NavTabHelper, type: :helper do

  it 'is an unordered list' do
    expect(helper.nav_tab()).to have_selector('ul.nav.nav-tabs')
  end

  context 'without any tab items' do

    it 'does not render any tabs' do
      expect(helper.nav_tab()).not_to have_selector('li')
    end

  end

  context 'with one active tab item' do

    let(:output) { output = helper.nav_tab('Currency' => '#') }

    it 'renders one tab' do
      expect(output).to have_selector('li', count: 1)
    end

    it 'is active' do
      expect(output).to have_selector('li.active')
    end

    it 'has the correct caption' do
      expect(output).to have_link('Currency', href: '#')
    end

  end

  context 'with one tab link' do

    let(:output) { output = helper.nav_tab('Currency' => currencies_path) }

    it 'renders one tab' do
      expect(output).to have_selector('li', count: 1)
    end

    it 'is not active' do
      expect(output).not_to have_selector('li.active')
    end

    it 'has the correct caption and path' do
      expect(output).to have_link('Currency', href: currencies_path)
    end

  end

  context 'with multiple links' do

   let(:output) do
     output = helper.nav_tab('Currency' => '#',
                             'Expense types' => expense_types_path,
                             'Payment types' => payment_types_path)
   end

    it 'renders the correct numer of links' do
      expect(output).to have_selector('li', count: 3)
    end

    it 'renders all links in order' do
      expect(output).to have_selector('li:first-child', text: 'Currency')
      expect(output).to have_selector('li:nth-child(2)', text: 'Expense types')
      expect(output).to have_selector('li:last-child', text: 'Payment types')
    end
  end

end
