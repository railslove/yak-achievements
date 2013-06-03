class CreateAchievedAchievements < ActiveRecord::Migration
  def change
    create_table :achieved_achievements do |t|
      t.integer   :achievement_id,  null: false
      t.integer   :squid_card_id,   null: false
      t.string    :value
      t.datetime  :achieved_at
    end

    add_index :achieved_achievements, :achievement_id
    add_index :achieved_achievements, :squid_card_id
    add_index :achieved_achievements, [:squid_card_id, :achievement_id], unique: true
  end
end