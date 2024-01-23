require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  # log user in before each one to get user-specific items
  before(:each) do
    @user = User.create!(username: "Rachael", password: "wowowow", email: "rachael@rachael.com")
    sign_in(@user)
  end

  describe 'GET #index' do
    it 'should display all items' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    it 'should save an instance of Item to the db' do
      params = { item: { name: 'Table', length: 30, width: 60 } }
      expect { post :create, params: params }.to change { Item.count }.by(1)
      expect(Item.last.name).to eq('Table')
    end
  end

  describe 'DELETE #destroy' do
    it 'should destroy the last item' do
      item = Item.create!(name: 'Table', length: 30, width: 60, user: @user)
      item.save
      expect { delete :destroy, params: { id: item.id } }.to change { Item.count }.by(-1)
    end
  end

  # describe 'DELETE #destroy' do
  #   it 'should change count of items by -1' do
  #     item = Item.create!(name: 'Table', length: 30, width: 60, user: @user)
  #     item.save
  #     original_count = Item.count
  #     item.destroy
  #     expect(Item.count).to eq(original_count - 1)
  #   end
  # end
end
