class CreateFloorPlanPictires < ActiveRecord::Migration[7.1]
  def change
    create_table :floor_plan_pictires do |t|
      t.references :apartment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
