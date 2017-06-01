RSpec.describe NavTabHelper, type: :helper do

  it 'is an un ordered list' do
    expect(helper.nav_tab('Home' => '#')).to have_selector('ul.nav.nav-tabs')
  end

  it 'does not render anything without at least one location' do
    expect(helper.nav_tab()).to eq nil

  end

  it 'accepts a current location' do
    expect(helper.nav_tab('Home' => '#')).to have_selector('li.active')
    expect(helper.nav_tab('Home' => '#')).to have_link('Home', href: '#')
  end

  it 'accepts a link location' do
    expect(helper.nav_tab('Currencies' => currencies_path)).to have_selector('li')
    expect(helper.nav_tab('Currencies' => currencies_path)).not_to have_selector('li.active')
    expect(helper.nav_tab('Currencies' => currencies_path)).to have_link('Currencies', href: currencies_path)
  end

end
