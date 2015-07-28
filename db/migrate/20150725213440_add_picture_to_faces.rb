class AddPictureToFaces < ActiveRecord::Migration
  def change
    add_column :faces, :picture, :string
        add_column :faces, :public, :boolean, default: false
  end
end
