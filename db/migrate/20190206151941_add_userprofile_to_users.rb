class AddUserprofileToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :link, :string
    add_column :users, :profile, :text
    add_column :users, :phone, :text
    add_column :users, :sex, :integer
  end
end
