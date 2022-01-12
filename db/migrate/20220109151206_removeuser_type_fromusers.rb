class RemoveuserTypeFromusers < ActiveRecord::Migration[7.0]
  def change
  remove_column :users,:userType
  end
end
