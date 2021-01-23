class RemoveTypeFromGroups < ActiveRecord::Migration[6.0]
  def change
    remove_column :groups, :type, :integer
  end
end
