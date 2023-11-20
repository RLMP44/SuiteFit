class CreateApartments < ActiveRecord::Migration[7.1]
  def change
    create_table :apartments do |t|
      t.string :name
      t.string :address
      t.float :total_floorspace
      t.float :price
      t.string :description
      t.string :type
      t.string :floor_plan
      t.string :qr_code
      t.references :agency, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
