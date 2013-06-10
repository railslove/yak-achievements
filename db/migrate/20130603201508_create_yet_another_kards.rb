class CreateYetAnotherKards < ActiveRecord::Migration
  def change
    create_table :yet_another_kards do |t|
      t.string  :uid,       null: false, limit: 40

      t.timestamps
    end

    add_index :yet_another_kards, :uid,       unique: true
  end
end
