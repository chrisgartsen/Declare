RSpec.shared_examples 'a table' do

  it 'has a table' do
    expect(rendered).to have_selector('table.table')
  end

  it 'has a table head section' do
    expect(rendered).to have_selector('thead')
  end

  it 'has a table body section' do
    expect(rendered).to have_selector('tbody')
  end

end
