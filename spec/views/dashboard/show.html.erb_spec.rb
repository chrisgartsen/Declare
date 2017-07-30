RSpec.describe "dashboards/show.html.erb", type: :view do


  describe '#markup' do

    let(:breadcrumb) {view.content_for(:breadcrumb) }

    before(:each) do
      @user = FactoryGirl.create(:user)
      @dashboard = Dashboard.new(user: @user)
      set_authentication(@user)
      assign(:dashboard, @dashboard)
      render
    end

    it 'has a page header' do
      expect(rendered).to have_selector('.pageheader', text: "Welcome #{current_user.name}")
    end

    it 'has a static reference to the index page' do
      expect(breadcrumb).to have_selector('.breadcrumb li.active', text: 'Dashboard')
    end

    it 'has a create project button' do
      expect(rendered).to have_link('Add project', href: new_project_path)
    end

    it 'has a project overview button' do
      expect(rendered).to have_link('Manage projects', href: projects_path)
    end


  end

  describe '#projects' do

    before(:each) do
      @user = FactoryGirl.create(:user)
      @first_project = FactoryGirl.create(:first_project, user: @user)
      @second_project = FactoryGirl.create(:second_project, user: @user)
      set_authentication(@user)
      assign(:dashboard, Dashboard.new(user: @user))
      render
    end

    it 'shows the project names' do
      expect(rendered).to have_selector('tbody tr:first-child td#project-name', text: @first_project.name)
      expect(rendered).to have_selector('tbody tr:last-child td#project-name',  text: @second_project.name)
    end

    it 'shows the outstanding amounts' do
      expect(rendered).to have_selector('tbody tr:first-child td#project-outstanding-amount', text: @first_project.outstanding_amount)
      expect(rendered).to have_selector('tbody tr:last-child td#project-outstanding-amount',  text: @second_project.outstanding_amount)
    end

    it 'shows the total amounts' do
      expect(rendered).to have_selector('tbody tr:first-child td#project-total-amount', text: @first_project.total_amount)
      expect(rendered).to have_selector('tbody tr:last-child td#project-total-amount',  text: @second_project.total_amount)
    end


  end

end
