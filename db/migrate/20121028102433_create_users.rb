class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name, :null => false
      t.string :password, :null => false

      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
