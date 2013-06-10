class AddCifToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :cif, :string
  end
end
