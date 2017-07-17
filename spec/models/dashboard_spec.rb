RSpec.describe Dashboard, type: :model do

  describe '#constructor' do

    it 'accepts the user as a parameter' do
      user = FactoryGirl.create(:user)
      dashboard = Dashboard.new(user: user)
      expect(dashboard.user.name).to eq(user.name)
    end

  end

  describe 'user' do

    it 'returns the username' do
      user = FactoryGirl.create(:user)
      dashboard = Dashboard.new(user: user)
      expect(dashboard.user_name).to eq(user.name)
    end

  end


end
