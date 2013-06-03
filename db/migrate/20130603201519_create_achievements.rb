class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.string  :title,       null: false
      t.integer :resource_id,   null: false

      t.integer :parent_id
      t.integer :lft
      t.integer :rgt


      t.timestamps
    end

    add_index :achievements, :resource_id
  end
end
