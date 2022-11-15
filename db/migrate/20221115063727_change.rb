class Change < ActiveRecord::Migration[6.1]
  def up
    remove_index :users, :email
  end

  def down
    add_index :users, :email, unique: true
    remove_column :users, :is_delete
  end
end
