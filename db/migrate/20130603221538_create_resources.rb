class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string  :key, null: false

      t.timestamps
    end

    add_index :resources, :key, unique: true
  end
end
