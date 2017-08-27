RSpec.describe 'contact_messages/new', type: :view do

  describe '#markup' do

    let(:breadcrumb){view.content_for(:breadcrumb)}

    before(:each) do
      assign(:contact_message, ContactMessage.new)
      render
    end

    it 'has a static link to the contact page' do
      expect(breadcrumb).to have_selector('.breadcrumb li.is-active a', text: 'Contact')
    end

    it 'has a page header' do
      expect(rendered).to have_selector('.pageheader', text: 'Contact')
    end

  end

  describe '#form' do

    before(:each) do
      assign(:contact_message, ContactMessage.new)
      render
    end

    it 'has a form' do
      expect(rendered).to have_selector('form')
    end

    it 'has a submit button' do
      expect(rendered).to have_selector("input[type='submit']")
    end

    it 'has an email field' do
      expect(rendered).to have_selector("input[type='text']#contact_message_email")
    end

    it 'has a message field' do
      expect(rendered).to have_selector("textarea#contact_message_message")
    end

  end

  describe '#form with errors' do

    before(:each) do
      message = FactoryGirl.build(:contact_message, :missing_message)
      message.valid?
      assign(:contact_message, message)
      render
    end

    it 'shows an error message' do
      expect(rendered).to have_selector('textarea.is-danger')
    end

    it 'list the error' do
      expect(rendered).to have_selector('p.help.is-danger', text: "Message can't be blank")
    end
  end

end
