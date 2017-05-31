RSpec.describe NavTabHelper, type: :helper do

  it 'is an un ordered list' do
    expect(helper.nav_tab('Home' => '#')).to have_selector('ul.nav.nav-tabs')
  end

  it 'requires at least one active location' do
    expect(helper.nav_tab('Home' => '#')).to have_selector('li.active', text: 'Home')
  end

end
