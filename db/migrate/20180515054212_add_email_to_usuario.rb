class AddEmailToUsuario < ActiveRecord::Migration[5.1]
  def change
    add_column :usuarios, :email, :string
  end
end
