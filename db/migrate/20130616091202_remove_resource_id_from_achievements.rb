class RemoveResourceIdFromAchievements < ActiveRecord::Migration
  def change
    remove_column :achievements, :resource_id
  end
end
