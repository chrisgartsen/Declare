require 'rails_helper'

RSpec.feature 'Create new project', type: :feature, js: true do

  it 'creates and shows a new project' do

    user = FactoryGirl.create(:user)
    project = FactoryGirl.build(:project, user_id: user.id)

    login(user)

    click_link 'Projects'
    click_link 'add-project'

    expect(page.find('.pageheader')).to have_content('Add project')

    fill_in_form(project)

    expect(page.find('.pageheader')).to have_content('Project created')
    expect(page).to have_content(project.name)

  end

  private

  def login(user)
    visit root_path
    click_link 'Log in'
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

end
