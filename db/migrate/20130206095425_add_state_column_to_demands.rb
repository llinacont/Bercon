class AddStateColumnToDemands < ActiveRecord::Migration
  def change
    add_column :demands, :state, :string, :default => 'creado'
  end
end
