class RenameAptTypeToCategory < ActiveRecord::Migration[7.1]
  def change
    rename_column :apartments, :apt_type, :category
  end
end
