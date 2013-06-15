class RemoveNestedSetFromAchievements < ActiveRecord::Migration
  def change
    remove_column :achievements, :parent_id
    remove_column :achievements, :lft
    remove_column :achievements, :rgt
  end
end
