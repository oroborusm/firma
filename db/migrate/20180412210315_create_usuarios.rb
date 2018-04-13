class CreateUsuarios < ActiveRecord::Migration[5.1]
  def change
    create_table :usuarios do |t|
      t.string :nombre
      t.string :cargo
      t.string :telefono

      t.timestamps
    end
  end
end
