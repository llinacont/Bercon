class AddUserIdToDemands < ActiveRecord::Migration
  def change
    add_column :demands, :user_id, :integer
  end
end
