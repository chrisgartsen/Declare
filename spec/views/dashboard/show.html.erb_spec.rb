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

  end

end
