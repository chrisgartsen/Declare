RSpec.describe 'contact_messages/show', type: :view do

  before(:each) do
    @contact_message = FactoryGirl.create(:contact_message)
    assign(:contact_message, @contact_message)
    render
  end

  let(:breadcrumb) { view.content_for(:breadcrumb)}

  it 'has a breadcrumb static reference to the view page' do
    expect(breadcrumb).to have_selector('.breadcrumb li.is-active a', text: 'Show message')
  end

  it 'has a breadcrumb link back to the contact page' do
    expect(breadcrumb).to have_selector('.breadcrumb li a', text: 'Contact')
  end

  it 'has a page header' do
    expect(rendered).to have_selector('.pageheader', text: 'Contact')
  end

  it 'shows the email' do
    expect(rendered).to have_selector('.form-control-static', text: @contact_message.email)
  end

  it 'shows the message' do
    expect(rendered).to have_selector('.form-control-static', text: @contact_message.message)
  end

  it 'shows the message created at date' do
    expect(rendered).to have_selector('.form-control-static', text: @contact_message.created_at)
  end

end
