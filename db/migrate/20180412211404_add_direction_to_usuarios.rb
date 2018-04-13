class AddDirectionToUsuarios < ActiveRecord::Migration[5.1]
  def change
    add_column :usuarios, :direccion, :string
  end
end
