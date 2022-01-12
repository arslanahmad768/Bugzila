class AdduserTypeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :userType, :integer
  end
end
