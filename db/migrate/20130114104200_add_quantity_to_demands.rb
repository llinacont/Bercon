class AddQuantityToDemands < ActiveRecord::Migration
  def change
    add_column :demands, :quantity, :integer
  end
end
