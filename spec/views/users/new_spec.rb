RSpec.describe 'users/new', type: :view do

  describe '#breadcrumb' do

    let(:breadcrumb) {view.content_for(:breadcrumb) }

    it 'has a static reference to the signup page' do
      assign(:user, User.new)
      render
      expect(breadcrumb).to have_selector('.breadcrumb li.is-active a', text: 'Sign up')
    end

  end

  describe '#markup' do

    before(:each) do
      assign(:user, User.new)
      render
    end

    it 'has a page header' do
      expect(rendered).to have_selector('.pageheader', text: 'Sign up')
    end

  end

  describe '#form' do

    before(:each) do
      assign(:user, User.new)
      render
    end

    it 'has a form' do
      expect(rendered).to have_selector('form')
    end

    it 'has a submit button' do
      expect(rendered).to have_selector("input[type='submit']")
    end

    it 'has a name field' do
      expect(rendered).to have_selector("input[type='text']#user_name")
    end

    it 'has an email field' do
      expect(rendered).to have_selector("input[type='text']#user_email")
    end

    it 'has a password field' do
      expect(rendered).to have_selector("input[type='password']#user_password")
    end

    it 'has a password confirmation field' do
      expect(rendered).to have_selector("input[type='password']#user_password_confirmation")
    end

    it 'does not show any errors' do
      expect(rendered).not_to have_selector('div.alert')
    end

  end

  describe '#form with errors' do

    before(:each) do
      user = FactoryGirl.build(:user, :missing_name)
      user.valid?
      assign(:user, user)
      render
    end

    it 'shows an error message' do
      expect(rendered).to have_selector('input.is-danger')
    end

    it 'list the error' do
      expect(rendered).to have_selector('p.help.is-danger', text: "Name can't be blank")
    end

  end

end
