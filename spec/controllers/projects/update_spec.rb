RSpec.describe ProjectsController, type: :controller do

  describe 'PUT #udate' do

    context 'when not logged in' do

      it 'redirects to the login page' do
        project = FactoryGirl.create(:project)
        clear_authentication
        put :update, params: { id: project.id, project: {name: 'UPDATED'} }
        expect(response).to redirect_to(login_path)
      end

    end

    context 'when logged in' do

      context 'with valid input' do

        it 'updates the project' do
          project = FactoryGirl.create(:project)
          set_authentication(project.user)
          put :update, params: { id: project.id, project: {name:'UPDATED'}}
          project.reload
          expect(project.name).to eq('UPDATED')
        end

        it 'redirects to the view page' do
          project = FactoryGirl.create(:project)
          set_authentication(project.user)
          put :update, params: { id: project.id, project: {name:'UPDATED'}}
          expect(response).to redirect_to project_path(project)
        end

        it 'does not update another users project' do
          project = FactoryGirl.create(:project)
          set_authentication(FactoryGirl.create(:additional_user))
          expect{
            put :update, params: { id: project.id, project: {name:'UPDATED'}}
            }.to raise_exception ActiveRecord::RecordNotFound
        end

      end

      context 'with invalid input' do

        before(:each) do
          @project = FactoryGirl.create(:project)
          set_authentication(@project.user)
          put :update, params: { id: @project.id, project: {name: nil}}
        end

        it 'does not update the project' do
          @project.reload
          expect(@project.name).not_to eq(nil)
        end

        it 're-renders the input form' do
          expect(response).to render_template(:edit)
        end

        it 'returns the original project' do
          expect(assigns(:project)).to eq(@project)
        end
      end

    end

  end

end
