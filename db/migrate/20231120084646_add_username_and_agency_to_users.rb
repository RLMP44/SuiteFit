class AddUsernameAndAgencyToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :username, :string
    add_column :users, :agency, :boolean, default: false
  end
end
