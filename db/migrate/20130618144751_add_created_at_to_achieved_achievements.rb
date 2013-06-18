class AddCreatedAtToAchievedAchievements < ActiveRecord::Migration
  def change
    add_column :achieved_achievements, :created_at, :datetime
    AchievedAchievement.all.each do |a|
      a.update_attribute(:created_at, Time.now)
    end
  end
end
