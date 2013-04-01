class AddObjectIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :object_id, :integer
  end
end
