RSpec.describe ProjectsController, type: :controller do

  describe 'DELETE #destroy' do

    context 'when not logged in' do

      before(:each) do
        clear_authentication
        @project = FactoryGirl.create(:project)
      end

      it 'redirects to the login page' do
        delete :destroy, params: {id: @project.id}
        expect(response).to redirect_to login_path
      end

      it 'does not delete the project' do
        expect {
          delete :destroy, params: {id: @project.id}
          }.not_to change(Project, :count)
      end

    end

    context 'when logged in' do

      it 'deletes the project'

      it 'does not delete a project for another user'

      it 'redirects to the list page'

    end

  end

end
