class RemoveValueAndAchievedAtFromAchievedAchievements < ActiveRecord::Migration
  def change
    remove_column :achieved_achievements, :value
    remove_column :achieved_achievements, :achieved_at
  end
end
