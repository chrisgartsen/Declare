require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "GET #show" do

    it 'renders the home page' do
      get :show, params: { page: 'home' }
      expect(response).to render_template :home
    end

    it 'renders the contact page' do
      get :show, params: { page: 'contact' }
      expect(response).to render_template :contact
    end

    it 'renders the about page' do
      get :show, params: { page: 'about' }
      expect(response).to render_template :about
    end

    it 'renders a 404-error when the page does not exist' do
      get :show, params: { page: 'page-does-not-exist' }
      expect(response.status).to eq(404)
    end

  end

end
