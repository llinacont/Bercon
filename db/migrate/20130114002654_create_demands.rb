class CreateDemands < ActiveRecord::Migration
  def change
    create_table :demands do |t|
      t.integer :client_id
      t.integer :product_id
      
      t.timestamps
    end
  end
end
