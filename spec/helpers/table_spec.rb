# <%= table(headers: ['Code', 'Name', 'Created at']) do %>
#   <%= render @currencies %>
# <% end %>

RSpec.describe TableHelper, type: :helper do

  context '#markup' do

    let(:output) { helper.table() }

    it 'renders a table' do
      expect(output).to have_selector('table.table')
    end

    it 'renders a header' do
      expect(output).to have_selector('table thead')
    end

    it 'renders a body' do
      expect(output).to have_selector('table tbody')
    end

  end

  context '#header' do

    let(:output) {helper.table(['Code', 'Name','Created at'])}

    it 'renders the columns' do
      expect(output).to have_selector('thead th', count: 3)
    end

    it 'rembers the order of columns' do
      expect(output).to have_selector('th:first-child',  text: 'Code')
      expect(output).to have_selector('th:nth-child(2)', text: 'Name')
      expect(output).to have_selector('th:last-child',   text: 'Created at')
    end

  end

  context '#body' do

    it 'accepts a block' do
      expect {|b| helper.table(&b)}.to yield_with_no_args
    end

  end

end
