class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.float :length
      t.float :width
      t.string :icon
      t.references :user, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
