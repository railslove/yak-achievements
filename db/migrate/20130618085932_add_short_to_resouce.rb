class AddShortToResouce < ActiveRecord::Migration
  def change
    add_column :resources, :short, :string
  end
end
