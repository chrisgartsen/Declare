require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do

  describe '#application_name' do

    it 'returns the name of the application' do
      expect(helper.application_name).to eq("Declare!")
    end

  end

  describe "#user_name" do

    it 'returns the username when logged in' do
      user = FactoryGirl.create(:user)
      session[:user_id] = user.id
      expect(helper.user_name).to eq user.name
    end

    it 'returns nill when not logged in' do
      session[:user_id] = nil
      expect(helper.user_name).to be_nil
    end

  end

end
