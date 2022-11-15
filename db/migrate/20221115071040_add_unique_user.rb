class AddUniqueUser < ActiveRecord::Migration[6.1]
  def change
    remove_index
    add_index :users, :email, unique: true
  end
end
