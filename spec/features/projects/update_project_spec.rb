RSpec.feature 'Update project', type: :feature, js: true do

  context 'as a user' do

    it 'updates and shows an existing project' do
      project = FactoryGirl.create(:project)

      login(project.user)
      navigate_to_form(project)
      edit_name('New Name')
      check_outcome('New Name')
    end

    private

    def navigate_to_form(project)
      click_link 'list-projects'
      click_link "edit-project-#{project.id}"
      expect(page).to have_content('Edit Project')
    end

    def edit_name(new_value)
      within('form') do
        fill_in 'Name', with: new_value
        click_button 'update-project'
      end
    end

    def check_outcome(new_value)
      expect(page.find('.pageheader')).to have_content('Show project')
      expect(page).to have_content(new_value)
    end

  end

end
