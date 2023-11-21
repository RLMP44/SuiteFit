class RenameColumnTypeToAptType < ActiveRecord::Migration[7.1]
  def change
    rename_column :apartments, :type, :apt_type
  end
end
