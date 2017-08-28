require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do

  describe '#application_name' do

    it 'returns the name of the application' do
      expect(helper.application_name).to eq("Declare")
    end

  end

  describe '#main_page' do

    it 'returns true if the request is the main page' do
      params[:controller] = 'static_pages'
      params[:page] = 'home'
      expect(helper.main_page?).to be_truthy
    end

    it 'returns false if the request is not for the correct controller' do
      params[:controller] = 'another_controller'
      params[:page] = 'home'
      expect(helper.main_page?).to be_falsey
    end

    it 'returns false if the request is not for the correct page' do
      params[:controller] = 'static_pages'
      params[:page] = 'another_page'
      expect(helper.main_page?).to be_falsey
    end

  end

end
