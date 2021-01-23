class AddTypeToGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :type_group, :integer
  end
end
