class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer  "company_id"
      t.integer  "object_id"
      t.integer  "type_mask"
      t.timestamps
    end
  end
end
