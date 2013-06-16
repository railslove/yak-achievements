class CreateAchievementResources < ActiveRecord::Migration
  def change
    create_table :achievement_resources do |t|
      t.integer   :achievement_id,  null: false
      t.integer   :resource_id,     null: false
      t.timestamps
    end
  end
end
