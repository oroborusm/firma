class Usuario < ApplicationRecord

  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      usuario = find_by(id: row["id"]) || new
      usuario.attributes = row.to_hash
      usuario.save!
    end
  end  

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then CSV.new(file.path, nil, :ignore)
    when ".xls" then Excel.new(file.path)
    when ".xlsx" then Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def self.to_csv(options = {})
    desired_columns = ["id", "nombre", "cargo", "telefono", "direccion", "rut"]
	  CSV.generate(options) do |csv|
	    csv << column_names
	    all.each do |model|
	      csv << model.attributes.values_at(*column_names)
	    end
	  end
	end
end
