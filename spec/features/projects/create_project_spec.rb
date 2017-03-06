RSpec.feature 'Create project', type: :feature, js: true do

  context 'as a user' do

    it 'creates and shows a new project' do
      user = FactoryGirl.create(:user)
      project = FactoryGirl.build(:project, user_id: user.id)

      login(user)
      navigate_to_form
      fill_in_form(project)
      check_outcome(project)
    end

  end

  private

    def navigate_to_form
      click_link 'list-projects'
      click_link 'add-project'
      expect(page.find('.pageheader')).to have_content('Add project')
    end

    def fill_in_form(project)
      within('form') do
        fill_in 'Name', with: project.name
        click_button 'add-project'
      end
    end

    def check_outcome(project)
      expect(page.find('.pageheader')).to have_content('Show project')
      expect(page).to have_content(project.name)
    end

end
