require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  # log user in before each one to get user-specific items
  before(:each) do
    user = User.create!(username: "Rachael", password: "wowowow", email: "rachael@rachael.com")
    sign_in(user)
  end

  describe 'GET #index' do
    it 'should display all items' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe '#create' do
    it 'should save an instance of Item to the db' do
      params = { item: { name: 'Table', length: 30, width: 60 } }
      post :create, params: params
      expect(Item.last.name).to eq('Table')
    end
  end
end
