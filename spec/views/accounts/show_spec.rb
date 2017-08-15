require 'rails_helper'

RSpec.describe "accounts/show", type: :view do

  before(:each) do
    @user = FactoryGirl.create(:user)
    assign(:user, @user)
    render
  end

  let(:breadcrumb) {view.content_for(:breadcrumb) }

  it 'has a static reference to the account page' do
    expect(breadcrumb).to have_selector('.breadcrumb li.is-active a', text: 'Account')
  end

  it 'has a pageheader' do
    expect(rendered).to have_selector('.pageheader', text: 'Account information')
  end

  it 'shows the user name' do
    expect(rendered).to have_selector('td', text: @user.name)
  end

  it 'shows the user email' do
    expect(rendered).to have_selector('td', text: @user.email)
  end

end
