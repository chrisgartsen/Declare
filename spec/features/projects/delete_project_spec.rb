RSpec.feature 'Delete project', type: :feature, js: true do

  context 'as a user' do

    xit 'deletes a project' do
      project = FactoryGirl.create(:project)
      login(project.user)
      navigate_to_page
      delete_project(project)
      check_outcome(project)
    end

  end


end
