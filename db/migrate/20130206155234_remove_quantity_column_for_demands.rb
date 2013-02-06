class RemoveQuantityColumnForDemands < ActiveRecord::Migration
  def change
    remove_column :demands, :quantity
  end
end
