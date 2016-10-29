require 'rails_helper'

RSpec.describe 'users/new', type: :view do

  describe '#markup' do

    before(:each) do
      assign(:user, User.new)
      render
    end

    it 'has a page header' do
      expect(rendered).to have_selector('.pageheader', text: 'Sign up')
    end

  end

  describe '#form' do

  end

  describe '#form with errors' do

  end

end
