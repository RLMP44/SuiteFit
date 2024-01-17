require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  describe 'GET #index' do
    it 'should display all items' do
      get :index
      expect(response).to be_success
    end
  end

  describe '#create' do
    it 'should save an instance of Item to the db' do
      user = User.create!(username: "Rachael", password: "wowowow")
      params = { item: { name: 'Table', length: 30, width: 60 } }
      post :create, params: params
      expect(Item.last.name).to eq('Table')
    end
  end
end
