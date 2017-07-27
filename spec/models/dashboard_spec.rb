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

  describe 'projects' do

    it 'returns the projects of the user' do
      user = FactoryGirl.create(:user)
      first_project = FactoryGirl.create(:first_project, user: user)
      second_project = FactoryGirl.create(:second_project, user: user)
      third_project = FactoryGirl.create(:third_project, user: user)
      dashboard = Dashboard.new(user: user)
      expect(dashboard.projects).to match_array([first_project, second_project, third_project])
    end

    it 'does not return projects not of the user' do
      first_user = FactoryGirl.create(:user)
      second_user = FactoryGirl.create(:additional_user)
      first_project = FactoryGirl.create(:first_project, user: first_user)
      second_project = FactoryGirl.create(:second_project, user: second_user)
      dashboard = Dashboard.new(user: first_user)
      expect(dashboard.projects).not_to include(second_project)
    end

  end


end
