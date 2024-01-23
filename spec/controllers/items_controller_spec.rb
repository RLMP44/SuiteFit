require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  # log user in before each one to get user-specific items
  before(:each) do
    @user = User.create!(username: "Rachael", password: "wowowow", email: "rachael@rachael.com")
    sign_in(@user)
    @item = Item.create!(name: 'Table', length: 30, width: 60, user: @user)
    @item.save
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

  describe 'PATCH #update' do
    it 'should update an instance of an item' do
      @item.length = 55
      @item.save
      expect(@item.length).to eq(55)
    end
  end

  describe 'DELETE #destroy' do
    it 'should destroy the last item' do
      expect { delete :destroy, params: { id: @item.to_param } }.to change { Item.count }.by(-1)
    end
  end

  # Refactored above
  # describe 'DELETE #destroy' do
  #   it 'should change count of items by -1' do
  #     original_count = Item.count
  #     @item.destroy
  #     expect(Item.count).to eq(original_count - 1)
  #   end
  # end

  # No longer needed since show page no longer exists
  # describe 'GET #show' do
  #   it 'should display a specific item' do
  #     get :show, params: { id: @item.id }
  #     expect(response).to have_http_status(200)
  #   end
  # end
end
