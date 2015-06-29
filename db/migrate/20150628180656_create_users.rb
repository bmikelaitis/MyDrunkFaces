class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
    	t.string :email
    	t.boolean :emailauth,  default: false
    	t.timestamps 
    end
  end
end
