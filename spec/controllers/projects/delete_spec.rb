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

      it 'deletes the project' do
        project = FactoryGirl.create(:project)
        set_authentication(project.user)
        expect{
          delete :destroy, params: {id: project.id}
          }.to change(Project, :count).by(-1)
      end

      it 'does not delete a project for another user' do
        project = FactoryGirl.create(:project)
        set_authentication(FactoryGirl.create(:additional_user))
        expect{
          delete :destroy, params: {id: project.id}
          }.to raise_error ActiveRecord::RecordNotFound

      end

      it 'redirects to the list page' do
        project = FactoryGirl.create(:project)
        set_authentication(project.user)
        delete :destroy, params: {id: project.id}
        expect(response).to redirect_to projects_path
      end

    end

  end

end
