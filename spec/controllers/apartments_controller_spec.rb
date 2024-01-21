require 'rails_helper'

RSpec.describe ApartmentsController, type: :controller do
  describe 'GET #index' do
    it 'displays all apartments' do
      sign_in create(:user)
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #show' do
    it 'displays an apartment\'s page to a visitor and increments impressions counter' do
      apartment = create(:apartment)
      initial_view_count = apartment.impression_counter

      get :show, params: { id: apartment.to_param }
      apartment.reload

      expect(response).to have_http_status(200)
      expect(apartment.impression_counter).to eq(initial_view_count + 1)
    end
  end
end
