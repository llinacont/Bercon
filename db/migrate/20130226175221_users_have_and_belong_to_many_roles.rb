class UsersHaveAndBelongToManyRoles < ActiveRecord::Migration
  def change
    add_column :users, :roles, :string
    add_column :users, :roles_mask, :integer
  end

end
