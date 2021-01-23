class CreateConcierts < ActiveRecord::Migration[6.0]
  def change
    create_table :concierts do |t|
      t.integer :people
      t.time :duration
      t.date :date
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
