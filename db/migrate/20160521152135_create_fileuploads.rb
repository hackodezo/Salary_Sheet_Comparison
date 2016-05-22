class CreateFileuploads < ActiveRecord::Migration
  def change
    create_table :fileuploads do |t|
      t.string :project_name
      t.string :file_name
      t.string :start
      t.string :end
      t.string :unique
      t.string :last_row

      t.timestamps null: false
    end
  end
end
