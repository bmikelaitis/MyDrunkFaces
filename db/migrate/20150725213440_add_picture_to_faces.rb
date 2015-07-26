class AddPictureToFaces < ActiveRecord::Migration
  def change
    add_column :faces, :picture, :string
  end
end
