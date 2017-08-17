RSpec.describe 'projects/show', type: :view do

  before(:each) do
    @project = FactoryGirl.create(:project)
    assign(:project, @project)
    render
  end

  let(:breadcrumb) { view.content_for(:breadcrumb)}

  it 'has a breadcrumb static reference to the view page' do
    expect(breadcrumb).to have_selector('.breadcrumb li.is-active a', text: 'Show project')
  end

  it 'has a breadcrumb link back to the project index page' do
    expect(breadcrumb).to have_selector('.breadcrumb li a', text: 'Projects')
    expect(breadcrumb).to have_link('Projects', href: projects_path)
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
