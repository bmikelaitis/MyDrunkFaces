class AddUserIdToFaces < ActiveRecord::Migration
  def change
    add_column :faces, :user_id, :integer
  end
end
