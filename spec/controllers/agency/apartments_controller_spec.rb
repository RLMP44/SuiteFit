require 'rails_helper'

RSpec.describe Agency::ApartmentsController, type: :controller do
  # before(:each) do
  #   sign_in create(:user, agency: true)
  # end

  describe 'GET #index' do
    it 'displays all apartments' do
      sign_in create(:user, agency: true)
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'displays an apartment\'s page and doesn\'t increment impressions counter' do
      user = create(:user, agency: true)
      sign_in user

      apartment = create(:apartment, agency_id: user.id)
      initial_view_count = apartment.impression_counter

      get :show, params: { id: apartment.to_param }
      apartment.reload

      expect(response).to have_http_status(:success)
      expect(apartment.impression_counter).to eq(initial_view_count)
    end
  end
end
