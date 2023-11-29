class AddHiddenToApartments < ActiveRecord::Migration[7.1]
  def change
    add_column :apartments, :hidden, :boolean, default: true
  end
end
