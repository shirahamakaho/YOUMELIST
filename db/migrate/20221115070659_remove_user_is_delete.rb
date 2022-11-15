class RemoveUserIsDelete < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :is_delete, :boolean
  end
end
