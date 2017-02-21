RSpec.describe 'projects/new', type: :view do

  describe '#markup' do

    let(:breadcrumb) { view.content_for(:breadcrumb) }

    before(:each) do
      assign(:project, Project.new)
      render
    end

    it 'has a link back to the project index page' do
      expect(breadcrumb).to have_link('Projects', href: projects_path )
    end

    it 'has a static reference to the create page' do
      expect(breadcrumb).to have_selector('.breadcrumb li.active', text: 'Add Project' )
    end

    it 'has a page header' do
      expect(rendered).to have_selector('.pageheader', text: 'Add project')
    end

  end

end
