require 'rails_helper'

RSpec.describe "accounts/show", type: :view do

  before(:each) do
    @user = FactoryGirl.create(:user)
    assign(:user, @user)
    render
  end

  it 'has a pageheader' do
    expect(rendered).to have_selector('.pageheader', text: 'Account information')
  end

  it 'shows the user name' do
    expect(rendered).to have_selector('.form-control-static', text: @user.name)
  end

  it 'shows the user email' do
    expect(rendered).to have_selector('.form-control-static', text: @user.email)
  end

end
