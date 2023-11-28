class AddImpressionCounterToApartments < ActiveRecord::Migration[7.1]
  def change
    add_column :apartments, :impression_counter, :integer, default: 0
  end
end
