class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.date :debut_date
      t.integer :type

      t.timestamps
    end
  end
end
