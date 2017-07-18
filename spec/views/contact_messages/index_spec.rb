RSpec.describe 'contact_messages/index', type: :view do

  describe '#markup' do

    let(:breadcrumb) {view.content_for(:breadcrumb) }

    before(:each) do
      assign(:contact_messages, [])
      render
    end

    it 'has a page header' do
      expect(rendered).to have_selector('.pageheader', text: 'Contact messages')
    end

    it 'has a static reference to the index page' do
      expect(breadcrumb).to have_selector('.breadcrumb li.active', text: 'Contact messages')
    end

    it_behaves_like 'a table'

    it 'shows column headers' do
      expect(rendered).to have_selector 'th', text: 'Email'
      expect(rendered).to have_selector 'th', text: 'Message'
      expect(rendered).to have_selector 'th', text: 'Created at'
    end

  end

  describe '#content' do

    before(:each) do
      @message1 = FactoryGirl.create(:contact_message)
      @message2 = FactoryGirl.create(:second_message)
      assign(:contact_messages, [@message1, @message2])
      render
    end

    it 'shows the correct number of messages' do
      expect(rendered).to have_selector('tbody tr', count: 2)
    end

    it 'shows the message' do
      expect(rendered).to have_selector('tbody tr:first-child td#contact-message-email', text: @message1.email)
      expect(rendered).to have_selector('tbody tr:last-child td#contact-message-email', text: @message2.email)
    end

    it 'shows the email' do
      expect(rendered).to have_selector('tbody tr:first-child td#contact-message-message', text: @message1.message)
      expect(rendered).to have_selector('tbody tr:last-child td#contact-message-message', text: @message2.message)
    end


    it 'shows the created at' do
      expect(rendered).to have_selector('tbody tr:first-child td#contact-message-created-at', text: @message1.created_at)
      expect(rendered).to have_selector('tbody tr:last-child td#contact-message-created-at', text: @message2.created_at)
    end

  end

end
