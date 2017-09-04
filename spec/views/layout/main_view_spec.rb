require 'rails_helper'

RSpec.describe 'layouts/_main' do

  describe '#markup' do

    before(:each) do
      render
    end

    it 'has a main element' do
      expect(rendered).to have_selector('main')
    end

    it 'wrapped in a columns container' do
      expect(rendered).to have_selector('div.columns')
    end

  end

end
