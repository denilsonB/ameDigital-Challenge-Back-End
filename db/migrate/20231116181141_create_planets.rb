class CreatePlanets < ActiveRecord::Migration[7.0]
  def change
    create_table :planets do |t|
      t.string :name
      t.string :weather
      t.string :ground
      t.integer :number_of_appearances, default: 0

      t.timestamps
    end
  end
end
