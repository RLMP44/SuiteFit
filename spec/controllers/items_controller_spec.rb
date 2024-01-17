require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  describe '#create' do
    it 'should save an instance of Item to the db' do
      params = { item: { name: 'Table', length: 30, width: 60 } }
      post :create, params: params
      expect(Item.last.name).to eq('Table')
    end
  end
end
