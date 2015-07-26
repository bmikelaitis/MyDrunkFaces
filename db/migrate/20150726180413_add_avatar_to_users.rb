class AddAvatarToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avatar, :string, default:"/uploads/user/avatar/default.jpg"
  end
end
