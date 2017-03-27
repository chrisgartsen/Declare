RSpec.feature 'Delete project', type: :feature, js: true do

  context 'as a user' do

    it 'deletes a project' do
      project = FactoryGirl.create(:project)
      login(project.user)
      navigate_to_page
      delete_project(project)
      check_outcome(project)
    end

    private

      def navigate_to_page
        click_link 'list-projects'
      end

      def delete_project(project)
        click_link "delete-project-#{project.id}"
      end

      def check_outcome(project)
        expect(page.find('.pageheader')).to have_content('Projects')
        expect(page).not_to have_content(project.name)
      end

  end

end
