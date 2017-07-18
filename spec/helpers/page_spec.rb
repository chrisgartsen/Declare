RSpec.describe PageHelper, type: :helper do

  describe '#pageheader' do

    it 'shows the title in a header tag' do
      expect(helper.pageheader('Title')).to have_selector('h1.pageheader', text: 'Title')
    end

  end

end
