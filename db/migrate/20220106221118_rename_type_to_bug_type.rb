class RenameTypeToBugType < ActiveRecord::Migration[7.0]
  def change
    rename_column :bugs, :type, :bugType
  end
end
