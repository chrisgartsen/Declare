require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do

  describe '#application_name' do

    it 'returns the name of the application' do
      expect(helper.application_name).to eq("Declare!")
    end

  end

  describe '#current_user' do

    it 'returns the user when logged in' do
      user = FactoryGirl.create(:user)
      session[:user_id] = user.id
      expect(helper.current_user).to eq user
    end

    it 'returns nil when nog logged in' do
      session[:user_id] = nil
      expect(helper.current_user).to be_nil
    end

  end


  describe '#logged_in?' do

    it 'returns true when logged in' do
      user = FactoryGirl.create(:user)
      session[:user_id] = user.id
      expect(helper.logged_in?).to be_truthy
    end

    it 'returns false when not logged in' do
      session[:user_id] = nil
      expect(helper.logged_in?).to be_falsey
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
