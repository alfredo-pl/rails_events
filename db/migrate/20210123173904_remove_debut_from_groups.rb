class RemoveDebutFromGroups < ActiveRecord::Migration[6.0]
  def change
    remove_column :groups, :debut_date, :date
  end
end
