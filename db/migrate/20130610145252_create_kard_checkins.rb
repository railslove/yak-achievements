class CreateKardCheckins < ActiveRecord::Migration
  def change
    create_table :kard_checkins do |t|
      t.integer :resource_id,         null: false
      t.integer :yet_another_kard_id, null: false

      t.timestamps
    end

    add_index :kard_checkins, :resource_id
    add_index :kard_checkins, :yet_another_kard_id
  end
end
