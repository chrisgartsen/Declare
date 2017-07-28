require 'rails_helper'

RSpec.describe 'projects/index', type: :view do


  describe '#markup' do

    let(:breadcrumb) {view.content_for(:breadcrumb) }

    before(:each) do
      assign(:projects, [])
      render
    end

    it 'has a page header' do
      expect(rendered).to have_selector('.pageheader', text: 'Projects')
    end

    it 'has a static reference to the index page' do
      expect(breadcrumb).to have_selector('.breadcrumb li.active', text: 'Projects')
    end

    it 'has a Add new project button' do
      expect(rendered).to have_link('Add project', href: new_project_path)
    end

  end

  describe '#table' do

    before(:each) do
      assign(:projects, [])
      render
    end

    it_behaves_like 'a table'

    it 'shows column headers' do
      expect(rendered).to have_selector 'th', text: 'Name'
      expect(rendered).to have_selector 'th', text: 'Created at'
      expect(rendered).to have_selector 'th', text: 'Updated at'
    end

  end

  describe '#table content' do

    before(:each) do
      user = FactoryGirl.create(:user)
      session[:user_id] = user.id
      @first_project = FactoryGirl.create(:first_project, user_id: user.id)
      @second_project = FactoryGirl.create(:second_project, user_id: user.id)
    assign(:projects, [@first_project, @second_project])
      render
    end

    it 'shows the correct number of projects' do
      expect(rendered).to have_selector('tbody tr', count: 2)
    end

    it 'shows the name' do
      expect(rendered).to have_selector('tbody tr:first-child td#project-name', text: @first_project.name)
      expect(rendered).to have_selector('tbody tr:last-child td#project-name', text: @second_project.name)
    end

    it 'shows the created at' do
      expect(rendered).to have_selector('tbody tr:first-child td#project-created-at', text: @first_project.created_at)
      expect(rendered).to have_selector('tbody tr:last-child td#project-created-at', text: @second_project.created_at)
    end

    it 'shows the updated at' do
      expect(rendered).to have_selector('tbody tr:first-child td#project-updated-at', text: @first_project.updated_at)
      expect(rendered).to have_selector('tbody tr:last-child td#project-updated-at', text: @second_project.updated_at)
    end

    it 'has a show button' do
      expect(rendered).to have_selector('tbody tr:first-child a#show-project')
      expect(rendered).to have_selector('tbody tr:last-child a#show-project')
    end

    it 'has a edit button' do
      expect(rendered).to have_selector("tbody tr:first-child a#edit-project-#{@first_project.id}")
      expect(rendered).to have_selector("tbody tr:last-child a#edit-project-#{@second_project.id}")
    end

    it 'has a delete button' do
      expect(rendered).to have_selector("tbody tr:first-child a#delete-project-#{@first_project.id}")
      expect(rendered).to have_selector("tbody tr:last-child a#delete-project-#{@second_project.id}")
    end

  end

end
