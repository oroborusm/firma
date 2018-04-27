class AddRutToUsuario < ActiveRecord::Migration[5.1]
  def change
    add_column :usuarios, :rut, :string
  end
end
