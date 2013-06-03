class CreateSquidCards < ActiveRecord::Migration
  def change
    create_table :squid_cards do |t|
      t.string  :uid,       null: false, limit: 40

      t.timestamps
    end

    add_index :squid_cards, :uid,       unique: true
  end
end
