RSpec.describe 'projects/show', type: :view do

  describe '#markup' do

    let(:breadcrumb) { view.content_for(:breadcrumb)}

    before(:each) do
      @project = FactoryGirl.build_stubbed(:project, name: 'My Project')
      assign(:project, @project)
      render
    end

    it 'has a static reference to the view page' do
      expect(breadcrumb).to have_selector('.breadcrumb li.is-active a', text: @project.name)
    end

    it 'has a breadcrumb link back to the project index page' do
      expect(breadcrumb).to have_selector('.breadcrumb li a', text: 'Dashboard')
      expect(breadcrumb).to have_link('Dashboard', href: root_path)
    end

  end

  describe '#project' do

    before(:each) do
      @project = FactoryGirl.build_stubbed(:project, name: 'My Project', created_at: Time.now, updated_at: Time.new)
      assign(:project, @project)
      render
    end

    it 'has a page header' do
      expect(rendered).to have_selector('.pageheader', text: 'Show project')
    end

    it 'shows the project name' do
      expect(rendered).to have_selector('td', text: @project.name)
    end

    it 'shows the project created at date' do
      expect(rendered).to have_selector('td', text: @project.created_at)
    end

    it 'shows the project created at date' do
      expect(rendered).to have_selector('td', text: @project.updated_at)
    end

    it 'has a return link to the index page' do
      expect(rendered).to have_link('Back to list', href: projects_path)
    end

  end
end
