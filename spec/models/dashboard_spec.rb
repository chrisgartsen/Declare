RSpec.describe Dashboard, type: :model do

  describe '#constructor' do

    it 'accepts and sets the user' do
      user = FactoryGirl.create(:user)
      dashboard = Dashboard.new(user: user)
      expect(dashboard.user.name).to eq(user.name)
    end

  end

end
