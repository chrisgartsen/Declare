require 'rails_helper'

RSpec.describe 'layouts/_main' do

  describe '#markup' do

    before(:each) do
      render
    end

    it 'has a main element' do
      expect(rendered).to have_selector('main')

    end

    it 'wrapped in a fluid container' do
      expect(rendered).to have_selector('main.container-fluid')
    end

  end

end
