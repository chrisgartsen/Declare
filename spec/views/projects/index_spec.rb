require 'rails_helper'

RSpec.describe 'projects/index', type: :view do


  describe '#markup' do

    let(:breadcrumb) {view.content_for(:breadcrumb) }

    before(:each) do
      assign(:projects, [])
      render
    end

    it 'has a static reference to the index page' do
      expect(breadcrumb).to have_selector('.breadcrumb li.is-active a', text: 'Dashboard')
    end

    it 'has a Add new project button' do
      expect(rendered).to have_link('Add project', href: new_project_path)
    end

  end

  describe '#nav tabs' do

    before(:each) do
      user = FactoryGirl.create(:user)
      session[:user_id] = user.id
      @first_project = FactoryGirl.create(:first_project, user_id: user.id)
      @second_project = FactoryGirl.create(:second_project, user_id: user.id)
      assign(:projects, [@first_project, @second_project])
      render
    end

    it 'has a tab section' do
      expect(rendered).to have_selector('div.tabs')
    end

    it 'has an active tab element' do
      expect(rendered).to have_selector('li.is-active a', text: 'Overview')
    end

    it 'shows all projects as tab elements' do
      expect(rendered).to have_selector('li a', text: @first_project.name)
      expect(rendered).to have_selector('li a', text: @second_project.name)
      expect(rendered).to have_link(@first_project.name, href: project_path(@first_project.id))
      expect(rendered).to have_link(@second_project.name, href: project_path(@second_project.id))
    end

  end

  describe '#projects' do

    before(:each) do
      user = FactoryGirl.create(:user)
      session[:user_id] = user.id
      @first_project = FactoryGirl.create(:first_project, user_id: user.id)
      @second_project = FactoryGirl.create(:second_project, user_id: user.id)
      assign(:projects, [@first_project, @second_project])
      render
    end

    it_behaves_like 'a table'

    it 'shows column headers' do
      expect(rendered).to have_selector 'th', text: 'Name'
      expect(rendered).to have_selector 'th', text: 'Created at'
      expect(rendered).to have_selector 'th', text: 'Updated at'
    end

    it 'has a subheader' do
      expect(rendered).to have_selector('h4.title.is-4', text: 'Projects')
    end

    it 'shows the correct number of projects' do
      expect(rendered).to have_selector('tbody tr', count: 2)
    end

    it 'shows the name' do
      expect(rendered).to have_selector('tbody tr:first-child td#project-name', text: @first_project.name)
      expect(rendered).to have_selector('tbody tr:last-child td#project-name', text: @second_project.name)
    end

    it 'shows the outstanding amounts' do
      expect(rendered).to have_selector('tbody tr:first-child td#project-outstanding-amount', text: @first_project.outstanding_amount)
      expect(rendered).to have_selector('tbody tr:last-child td#project-outstanding-amount',  text: @second_project.outstanding_amount)
    end

    it 'shows the total amounts' do
      expect(rendered).to have_selector('tbody tr:first-child td#project-total-amount', text: @first_project.total_amount)
      expect(rendered).to have_selector('tbody tr:last-child td#project-total-amount',  text: @second_project.total_amount)
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
