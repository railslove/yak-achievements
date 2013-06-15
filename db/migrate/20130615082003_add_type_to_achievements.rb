class AddTypeToAchievements < ActiveRecord::Migration
  def change
    add_column :achievements, :achievement_type, :string
  end
end
