class AddSettingsToAchievements < ActiveRecord::Migration
  def change
    add_column :achievements, :settings, :string
  end
end
