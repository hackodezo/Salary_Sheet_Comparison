class Makemodel < ActiveRecord::Migration
  def self.import(file,project_name,file_name,start_column,end_column,unique,last_row)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    binding.pry
    name = "#{project_name.downcase}"+"#{file_name.downcase}"
    create_table name.pluralize do |t|
      header.each do |head|
        t.string head
      end
    end
    model_file = File.join("app", "models", name.singularize+".rb")
    model_name = name.singularize.capitalize
    File.open(model_file, "w+") do |f|
      f << "class #{model_name} < ActiveRecord::Base\nend"
    end

    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      product = Projectsource.new
      product.attributes = row.to_hash
      product.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Csv.new(file.path, nil, :ignore)
      when ".xls" then Roo::Excel.new(file.path)
      when ".xlsx" then Roo::Excelx.new(file.path)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end
end
