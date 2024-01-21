require 'rails_helper'

RSpec.describe ApartmentsController, type: :controller do
  before(:each) do
    sign_in create(:agency)
  end

  describe 'GET #index' do
    it 'displays all apartments' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #show' do
    it 'displays an apartment\'s page and doesn\'t increment impressions counter' do
      apartment = create(:apartment)
      # p apartment.agency.username
      initial_view_count = apartment.impression_counter

      get :show, params: { id: apartment.to_param }
      apartment.reload

      expect(response).to have_http_status(200)
      expect(apartment.impression_counter).to eq(initial_view_count)
    end
  end
end
