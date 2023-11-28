class RemoveIconFromItems < ActiveRecord::Migration[7.1]
  def change
    remove_column :items, :icon
  end
end
