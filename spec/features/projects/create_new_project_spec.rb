require 'rails_helper'

RSpec.feature 'Create new project', type: :feature, js: true do

  context 'as a user' do

    xit 'creates and shows a new project' do
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

    def login(user)
      visit root_path
      click_link 'log-in'
      within('form') do
        fill_in 'email', with: user.email
        fill_in 'password', with: user.password
        click_button 'login-button'
      end
    end

    def fill_in_form(project)
      within('form') do
        fill_in 'name', with: project.name
        click_button 'Create'
      end
    end

    def check_outcome(project)
      expect(page.find('.pageheader')).to have_content('Project created')
      expect(page).to have_content(project.name)
    end

end
