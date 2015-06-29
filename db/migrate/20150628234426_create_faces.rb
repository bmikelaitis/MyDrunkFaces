class CreateFaces < ActiveRecord::Migration
  def change
    create_table :faces do |t|
      t.string :picture
      t.text :description
      t.boolean :status,  default: false
      t.timestamps 
    end
  end
end
